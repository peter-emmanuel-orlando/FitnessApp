import { ActionTypes } from '../action-types';
import { initialState } from '../initial-state';

export const allUsersReducer = (state = initialState.users, action: any) => {
    switch (action.type) {
        case ActionTypes.GET_USERS:
            return action.payload;

        default:
            return state;
    }
};