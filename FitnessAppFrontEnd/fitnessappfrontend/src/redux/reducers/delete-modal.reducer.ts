import { ActionTypes } from '../action-types';
import { initialState } from '../initial-state';

export const deleteModalReducer = (state = initialState.deleteModal, action: any) => {
    switch (action.type) {
        case ActionTypes.TOGGLE_CONFIRM_MODAL:
        return { active: action.payload };

        default: return state;
    }
};