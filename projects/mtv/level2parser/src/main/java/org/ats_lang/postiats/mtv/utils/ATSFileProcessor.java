package org.ats_lang.postiats.mtv.utils;

import java.io.*;
import java.util.List;

/**
 * Created by alex on 2/21/16.
 */

public class ATSFileProcessor {

	private String m_pathInput;
	private File m_pathLevel2Json;

	public ATSFileProcessor(String path) {
		m_pathInput = path;
	}

	/*
	 * return:
	 *   = 0: O.K.
	 *   != 0: Error
	 */
	public int toLevel2Json() throws IOException, InterruptedException {

		File finput = new File(m_pathInput);
		if (!FilenameUtils.isATS(finput)) {
			return 1;
		}

		// Create temporary directory.
		File tempDir = new File(System.getProperty("java.io.tmpdir", null),
				"conats" + Long.toString(System.nanoTime()));
		if (!tempDir.exists() && !tempDir.mkdir())
			throw new IOException("Failed to create temporary directory " + tempDir);
		Log.log4j.info("tempDir is " + tempDir.getAbsolutePath());

		// Generate list for remote files.
		File list_file = new File(tempDir.getAbsolutePath(), "pdgreloc.json");
		ProcessBuilder pb = new ProcessBuilder("patsopt",
				"--pkgreloc", "-DATS", "ATSPKGRELOCROOT=\"" + tempDir.getAbsolutePath() + "\"",
				"--output-w", list_file.getAbsolutePath(),
				"-d", finput.getAbsolutePath());

		System.out.println("cmd is " + getProcessCommand(pb));
		pb.redirectErrorStream(true);
		Process child = pb.start();
		String lines = readFromProcess(child.getInputStream());
		int returnCode = child.waitFor();
		System.out.println("returnCode is " + returnCode);
		if (0 != returnCode) {
			System.err.println("\"patsopt --pkgreloc\" failed.");
			System.err.println(lines);
			return returnCode;
		}

		// Download remote files.
		pb = new ProcessBuilder("atspkgreloc_curl", list_file.getAbsolutePath());
		System.out.println("cmd is " + getProcessCommand(pb));
		pb.redirectErrorStream(true);
		child = pb.start();
		lines = readFromProcess(child.getInputStream());
		returnCode = child.waitFor();
		System.out.println("returnCode is " + returnCode);
		if (0 != returnCode) {
			System.err.println("\"atspkgreloc_curl\" failed.");
			System.err.println(lines);
			return returnCode;
		}

		// Parse the input file.
		m_pathLevel2Json = FilenameUtils.toJson(finput);
		pb = new ProcessBuilder("patsopt",
				"-DATS", "ATSPKGRELOCROOT=\"" + tempDir.getAbsolutePath() + "\"",
				"-o", m_pathLevel2Json.getAbsolutePath(),
				"--jsonize-2", "-d", finput.getAbsolutePath());
		System.out.println("cmd is " + getProcessCommand(pb));
		pb.redirectErrorStream(true);
		child = pb.start();
		lines = readFromProcess(child.getInputStream());
		returnCode = child.waitFor();
		System.out.println("returnCode is " + returnCode);
		if (0 != returnCode) {
			System.err.println("\"patsopt --jsonize-2\" failed.");
			System.err.println(lines);
			return returnCode;
		}

		return 0;
	}

	private static String readFromProcess(InputStream is) throws IOException {
		String line = null;
		String lines = "";
		BufferedReader reader = new BufferedReader(new InputStreamReader(is));
		while ((line = reader.readLine()) != null) {
			lines += line;
		}
		return lines;
	}

	static String getProcessCommand(ProcessBuilder pb) {
		List<String> coms = pb.command();
		String command = "";
		for (String com: coms) {
			command += com + " ";
		}

		return command;
	}
}
