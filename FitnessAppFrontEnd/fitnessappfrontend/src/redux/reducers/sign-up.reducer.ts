import { ActionTypes } from '../action-types';
import { initialState } from '../initial-state';

export const signUpReducer = (state: any = initialState.signUpFields, action: any) => {
    switch (action.type) {
        case ActionTypes.UPDATE_USERNAME:
            return {
                ...state,
                username: action.payload
            };

        case ActionTypes.UPDATE_PASSWORD:
            return {
                ...state,
                password: action.payload
            };

        case ActionTypes.UPDATE_EMAIL:
            return {
                ...state,
                email: action.payload
            };

        case ActionTypes.UPDATE_NAME:
            return {
                ...state,
                name: action.payload
            };

        case ActionTypes.UPDATE_ISPRIVATE:
            return {
                ...state,
                private: action.payload
            };

        case ActionTypes.SIGN_UP:
            return { ...action.payload };

        default:
            return state;
    }
};