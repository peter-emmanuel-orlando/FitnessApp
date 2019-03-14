import { ActionTypes } from '../action-types';
import { ICredentials } from '../interfaces';
import { initialState } from '../initial-state';
import { appClient } from '../../axios/app.client';
import { setCredentialsCookie, clearCredentialsCookie } from '../../resources/htmlCookie.util';

export const updateCredentials = (username: string, password: string) => {
    return {
        type: ActionTypes.UPDATE_CREDS,
        payload: {
            password,
            username
        }
    };
};

export const login = (credentials: ICredentials) => async (dispatch) => {
    try {
        const res = (await appClient.post('auth', credentials));
        console.log(res.data);

        if (res.status === 200) {
            setCredentialsCookie(credentials);
            dispatch({
                type: ActionTypes.LOGIN,
                payload: {
                    ...res.data,
                    name: res.data.fullName,
                    private: res.data.isPrivate
                }
            });
            dispatch({
                type: ActionTypes.APP,
                payload: {
                    isLoggedIn: true,
                    isAdmin: (res.data.accountType.role === 'Admin')
                }
            });
            dispatch({
                type: ActionTypes.UPDATE_USERNAME,
                payload: res.data.username
            });
            dispatch({
                type: ActionTypes.UPDATE_NAME,
                payload: res.data.fullName
            });
            dispatch({
                type: ActionTypes.UPDATE_EMAIL,
                payload: res.data.email
            });
            dispatch({
                type: ActionTypes.UPDATE_ISPRIVATE,
                payload: res.data.isPrivate
            });
        } else if (res.status === 401) {
            console.log('401');
        }
    }
    catch (err) {
        console.log(err);
    }
};

export const logout = () => (dispatch) => {
    dispatch({
        type: ActionTypes.APP,
        payload: {
            isLoggedIn: false,
            isAdmin: false
        }
    });
    clearCredentialsCookie();
    dispatch({
        type: ActionTypes.LOGOUT,
        payload: initialState
    });
};