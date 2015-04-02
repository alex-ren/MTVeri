#include <ltsmin/pins.h>

#include "peterson.h"

// // state slot values
// static const int EMPTY = 0;    // " " or "."
// static const int BOX = 1;      // "$"
// static const int MAN = 2;      // "@"

// // transition labels
// static const int WALK_LEFT = 0;
// static const int PUSH_LEFT = 1;
// static const int WALK_RIGHT = 2;

// state labels
static const int CRITICAL_ZERO = 0;
static const int CRITICAL_ONE = 1;

static const int CRITICAL_SEG = 3;

int group_count() {
    return 2;
}

// State: (PC0:int, PC1:int, turn:int, flags:array)
int state_length() {
    return 4;
}

// no. of state label
int label_count() {
    return 2;
}

// State: (PC0:int, PC1:int, turn:int, flags:array)
// flag[0] = true;
int pg_transition_p0_0(model_t model, int*src,TransitionCB callback,void*user_context) {
    int dst[state_length()]; // the next state values
    // not all variables are modified so copy the source state
    memcpy(dst, src, sizeof(int) * state_length()); 

    dst[0] = 1;  // PC0 = 1

    // set the chunk
    int index = src[3];
    chunk res=GBchunkGet(model, char_array_type, index);
    char *flags_old = res.data;

    char flags[2] = {};
    flags[0] = 1;
    flags[1] = flags_old[1];
    index = GBchunkPut(model, char_array_type, chunk_ld(2, flags));
    dst[3] = index;

    int action[1];
    action[0] = action0_index;
    transition_info_t transition_info = { action, 0 };

    int cpy[4] = {1,0,0,1}; // provide modified variables
    callback(user_context, &transition_info, dst, cpy);
    return 1; // return number of successors
}

// State: (PC0:int, PC1:int, turn:int, flags:array)
// turn = 1;
int pg_transition_p0_1(model_t model, int*src,TransitionCB callback,void*user_context) {
    int dst[state_length()]; // the next state values
    // not all variables are modified so copy the source state
    memcpy(dst, src, sizeof(int) * state_length()); 

    dst[0] = 2;  // update PC0
    dst[2] = 1;  // turn = 1

    int action[1];
    action[0] = action0_index;
    transition_info_t transition_info = { action, 0 };

    int cpy[4] = {1,0,1,0}; // provide modified variables
    callback(user_context, &transition_info, dst, cpy);
    return 1; // return number of successors
}

// State: (PC0:int, PC1:int, turn:int, flags:array)
// while (flag[1] && turn == 1)
int pg_transition_p0_2(model_t model, int*src,TransitionCB callback,void*user_context) {
    int dst[state_length()]; // the next state values
    // not all variables are modified so copy the source state
    memcpy(dst, src, sizeof(int) * state_length()); 

    int turn = src[2];

    // get the chunk
    int index = src[3];
    chunk res=GBchunkGet(model, char_array_type, index);
    char *flags_old = res.data;

    // action
    int action[1];
    action[0] = action0_index;
    transition_info_t transition_info = { action, 0 };

    //
    if (1 == flags_old[1] && 1 == turn)
    {
        // do nothing, state is the same
        int cpy[4] = {0,0,0,0}; // provide modified variables
        callback(user_context, &transition_info, dst, cpy);
        return 1; // return number of successors
    }
    else {
        dst[0] = CRITICAL_SEG;  // PC0 = CRITICAL_SEG
        int cpy[4] = {1,0,0,0}; // provide modified variables
        callback(user_context, &transition_info, dst, cpy);
        return 1; // return number of successors
    }
}

// State: (PC0:int, PC1:int, turn:int, flags:array)
// flag[0] = false;
int pg_transition_p0_3(model_t model, int*src,TransitionCB callback,void*user_context) {
    int dst[state_length()]; // the next state values
    // not all variables are modified so copy the source state
    memcpy(dst, src, sizeof(int) * state_length()); 

    dst[0] = 4;  // PC0 = 4

    // set the chunk
    int index = src[3];
    chunk res=GBchunkGet(model, char_array_type, index);
    char *flags_old = res.data;

    char flags[2] = {};
    flags[0] = 0;
    flags[1] = flags_old[1];
    index = GBchunkPut(model, char_array_type, chunk_ld(2, flags));
    dst[3] = index;

    int action[1];
    action[0] = action0_index;
    transition_info_t transition_info = { action, 0 };

    int cpy[4] = {1,0,0,1}; // provide modified variables
    callback(user_context, &transition_info, dst, cpy);
    return 1; // return number of successors
}

// State: (PC0:int, PC1:int, turn:int, flags:array)
// end of process
int pg_transition_p0_4(model_t model, int*src,TransitionCB callback,void*user_context) {
    return 0;
}

// State: (PC0:int, PC1:int, turn:int, flags:array)
// flag[1] = true;
int pg_transition_p1_0(model_t model, int*src,TransitionCB callback,void*user_context) {
    int dst[state_length()]; // the next state values
    // not all variables are modified so copy the source state
    memcpy(dst, src, sizeof(int) * state_length()); 

    dst[1] = 1;  // PC1 = 1

    // set the chunk
    int index = src[3];
    chunk res=GBchunkGet(model, char_array_type, index);
    char *flags_old = res.data;

    char flags[2] = {};
    flags[0] = flags_old[0];
    flags[1] = 1;
    index = GBchunkPut(model, char_array_type, chunk_ld(2, flags));
    dst[3] = index;

    int action[1];
    action[0] = action1_index;
    transition_info_t transition_info = { action, 0 };

    int cpy[4] = {0,1,0,1}; // provide modified variables
    callback(user_context, &transition_info, dst, cpy);
    return 1; // return number of successors
}

// State: (PC0:int, PC1:int, turn:int, flags:array)
// turn = 0;
int pg_transition_p1_1(model_t model, int*src,TransitionCB callback,void*user_context) {
    int dst[state_length()]; // the next state values
    // not all variables are modified so copy the source state
    memcpy(dst, src, sizeof(int) * state_length()); 

    dst[1] = 2;  // update PC0
    dst[2] = 0;  // turn = 0

    int action[1];
    action[0] = action1_index;
    transition_info_t transition_info = { action, 0 };

    int cpy[4] = {0,1,1,0}; // provide modified variables
    callback(user_context, &transition_info, dst, cpy);
    return 1; // return number of successors
}

// State: (PC0:int, PC1:int, turn:int, flags:array)
// while (flag[0] && turn == 0)
int pg_transition_p1_2(model_t model, int*src,TransitionCB callback,void*user_context) {
    int dst[state_length()]; // the next state values
    // not all variables are modified so copy the source state
    memcpy(dst, src, sizeof(int) * state_length()); 

    int turn = src[2];

    // get the chunk
    int index = src[3];
    chunk res=GBchunkGet(model, char_array_type, index);
    char *flags_old = res.data;

    // action
    int action[1];
    action[0] = action1_index;
    transition_info_t transition_info = { action, 0 };

    //
    if (1 == flags_old[0] && 0 == turn)
    {
        // do nothing, state is the same
        int cpy[4] = {0,0,0,0}; // provide modified variables
        callback(user_context, &transition_info, dst, cpy);
        return 1; // return number of successors
    }
    else {
        dst[1] = CRITICAL_SEG;  // PC1 = CRITICAL_SEG
        int cpy[4] = {0,1,0,0}; // provide modified variables
        callback(user_context, &transition_info, dst, cpy);
        return 1; // return number of successors
    }
}

// State: (PC0:int, PC1:int, turn:int, flags:array)
// flag[1] = false;
int pg_transition_p1_3(model_t model, int*src,TransitionCB callback,void*user_context) {
    int dst[state_length()]; // the next state values
    // not all variables are modified so copy the source state
    memcpy(dst, src, sizeof(int) * state_length()); 

    dst[1] = 4;  // PC1 = 4

    // set the chunk
    int index = src[3];
    chunk res=GBchunkGet(model, char_array_type, index);
    char *flags_old = res.data;

    char flags[2] = {};
    flags[0] = flags_old[0];
    flags[1] = 0;
    index = GBchunkPut(model, char_array_type, chunk_ld(2, flags));
    dst[3] = index;

    int action[1];
    action[0] = action1_index;
    transition_info_t transition_info = { action, 0 };

    int cpy[4] = {0,1,0,1}; // provide modified variables
    callback(user_context, &transition_info, dst, cpy);
    return 1; // return number of successors
}

// State: (PC0:int, PC1:int, turn:int, flags:array)
// end of process
int pg_transition_p1_4(model_t model, int*src,TransitionCB callback,void*user_context) {
    return 0;
}

typedef int (*next_method_grp)(
        model_t model, int*src,TransitionCB cb,void*user_context);

next_method_grp arr0_steps[5] = {
    pg_transition_p0_0,
    pg_transition_p0_1,
    pg_transition_p0_2,
    pg_transition_p0_3,
    pg_transition_p0_4
};

next_method_grp arr1_steps[5] = {
    pg_transition_p1_0,
    pg_transition_p1_1,
    pg_transition_p1_2,
    pg_transition_p1_3,
    pg_transition_p1_4
};

int next_state(model_t model, int group, int *src, TransitionCB callback, void *arg) {

    if (0 == group) {
    	int P0 = src[0];
    	return (*arr0_steps[P0])(model, src, callback, arg);
    } else if (1 == group) {
    	int P1 = src[1];
    	return (*arr1_steps[P1])(model, src, callback, arg);
    }
    
    return 0; // return number of successors
}

// label: 0, 1
int state_label(model_t model, int label, int* src) {
    if (CRITICAL_ZERO == label) {
        return src[0] == CRITICAL_SEG;  // todo
    } 
    else if (CRITICAL_ONE == label) {
        return src[1] == CRITICAL_SEG;  // todo
    }
    else {
        return 0; // should not happen
    }
}

int initial[4] = {};
int* initial_state(model_t model) {
    initial[0] = 0;   // PC0
    initial[1] = 0;   // PC1
    initial[2] = 0;   // turn = 0

    char flags[2] = {};
    flags[0] = 0;
    flags[1] = 0;
    int index = GBchunkPut(model, char_array_type, chunk_ld(2, flags));
    initial[3] = index;

    return initial;
}

// 2 groups, 4 slots
int rm[2][4] = {
    {1,1,1,1},
    {1,1,1,1}
};
int* read_matrix(int row) {
    return rm[row];
}

// 2 groups, 4 slots
int wm[2][4] = {
    {1,1,1,1},
    {1,1,1,1}
};
int* write_matrix(int row) {
    return wm[row];
}

// 2 labels, 2 slots
// row: label
// column: slots
int lm[2][2] = {
    {1,1},
    {1,1}
};
int* label_matrix(int row) {
    return lm[row];
}


