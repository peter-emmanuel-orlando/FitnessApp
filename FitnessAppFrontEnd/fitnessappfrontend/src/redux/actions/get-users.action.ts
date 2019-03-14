import { ActionTypes } from '../action-types';
import { appClient } from '../../axios/app.client';

export const getUsers = () => async (dispatch) => {
    try {
        const res = await appClient.get('users');

        if (res.status >= 200 && res.status < 300) {
            const result = res.data.map(user => {
                return {
                    userid: user.id,
                    username: user.username,
                    // password: '', // don't send back the passwords
                    email: user.email,
                    name: user.fullName,
                    role: user.accountType.role,
                    private: user.isPrivate
                };
            });
            dispatch({
                    type: ActionTypes.GET_USERS,
                    payload: [ ...result ]
            });
        }
    }
    catch (err) {
        console.log(err);
    }
};