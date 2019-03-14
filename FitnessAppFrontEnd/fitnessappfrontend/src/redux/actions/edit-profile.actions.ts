import { ActionTypes } from '../action-types';
import { IUser } from '../interfaces';
import { appClient } from '../../axios/app.client';

export const updateUser = (fields: IUser) => async (dispatch) => {
    try {
        const res = await appClient.patch(`users/update`, {
            email: fields.email,
            fullname: fields.name,
            password: '',
            privateprofile: fields.private,
            username: fields.username
        });

        if (res.status >= 200 || res.status < 300) {
            console.log(res.data);
            dispatch({
                type: ActionTypes.LOGIN,
                payload: { ...fields }
            });
        }
    }
    catch (err) {
        console.log(err);
    }
};