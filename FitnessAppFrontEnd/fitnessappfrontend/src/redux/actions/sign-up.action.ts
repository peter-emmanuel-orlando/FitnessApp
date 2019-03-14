import { ActionTypes } from '../action-types';
import { IUser } from '../interfaces';
import { appClient } from '../../axios/app.client';

export const updateUsername = (value: string) => {
    return {
        type: ActionTypes.UPDATE_USERNAME,
        payload: value
    };
};

export const updatePassword = (value: string) => {
    return {
        type: ActionTypes.UPDATE_PASSWORD,
        payload: value
    };
};

export const updateName = (value: string) => {
    return {
        type: ActionTypes.UPDATE_NAME,
        payload: value
    };
};

export const updateEmail = (value: string) => {
    return {
        type: ActionTypes.UPDATE_EMAIL,
        payload: value
    };
};

export const updateIsPrivate = (value: boolean) => {
    return {
        type: ActionTypes.UPDATE_ISPRIVATE,
        payload: value
    };
};

export const signUp = (signUpFields: IUser) => async (dispatch) => {
    const res = await appClient.post('/users', {
        username: signUpFields.username,
        fullname:  signUpFields.name,
        password: signUpFields.password,
        email:  signUpFields.email,
        privateprofile: signUpFields.private,
    });

    dispatch({
        type: ActionTypes.SIGN_UP,
        payload: { ...signUpFields }
    });

    if (res.data) {
        dispatch({
            type: ActionTypes.LOGIN,
            payload: res.data
        });
        dispatch({
            type: ActionTypes.APP,
            payload: {
                isLoggedIn: true,
                isAdmin: false
            }
        });
    }

    dispatch(updateUsername(''));
    dispatch(updatePassword(''));
    dispatch(updateName(''));
    dispatch(updateEmail(''));
    dispatch(updateIsPrivate(false));
};