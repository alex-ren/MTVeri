
#ifndef _PETERSON_H_
#define _PETERSON_H_

#include <ltsmin/pins.h>

/**
 * @brief calls callback for every successor state of src in transition group "group".
 */
int next_state(model_t model, int group, int *src, TransitionCB callback, void *arg);

/**
 * @brief returns the initial state.
 */
int* initial_state(model_t model);

/**
 * @brief returns the read dependency matrix.
 */
int* read_matrix(int row);

/**
 * @brief returns the write dependency matrix.
 */
int* write_matrix(int row);

/**
 * @brief returns the state label dependency matrix.
 */
int* label_matrix(int row);

/**
 * @brief returns whether the state src satisfies state label "label".
 */
int state_label(model_t model, int label, int* src);

/**
 * @brief returns the number of transition groups.
 */
int group_count();

/**
 * @brief returns the length of the state.
 */
int state_length();

/**
 * @brief returns the number of state labels.
 */
int label_count();

extern int char_array_type;

extern int action0_index;
extern int action1_index;
#endif
