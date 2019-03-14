import { ActionTypes } from '../action-types';
import { appClient } from '../../axios/app.client';
import { logout } from './session.action';


export const open = () => {
    return {
        type: ActionTypes.TOGGLE_CONFIRM_MODAL,
        payload: true
    };
};

export const close = () => {
    return {
        type: ActionTypes.TOGGLE_CONFIRM_MODAL,
        payload: false
    };
};

export const onConfirm = (username: String) => async (dispatch) => {
    try {
        const res = await appClient.delete(`users/username/${username}`);
        if (res.status >= 200 && res.status < 300) {
            dispatch(logout());
        }
    }
    catch (err) {
        console.log(err);
    }
};