import { ActionTypes } from '../action-types';
import { initialState } from '../initial-state';

export const sessionReducer = (state = initialState.session, action: any) => {
    switch (action.type) {
        case ActionTypes.UPDATE_CREDS:
            return {
                user: state.user,
                credentials: action.payload
            };

        case ActionTypes.LOGIN:
            return {
                credentials: state.credentials,
                user: action.payload
            };

        case ActionTypes.LOGOUT:
            return { ...action.payload };

        default:
            return state;
    }
};