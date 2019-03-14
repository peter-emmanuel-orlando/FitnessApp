import React, { Component } from 'react';
import { connect } from 'react-redux';
import { IUser, IState } from '../../redux/interfaces';
import * as actions from '../../redux/actions/sign-up.action';
import { async } from 'q';
import { appClient } from '../../axios/app.client';
import { login } from '../../redux/actions/session.action';
import { ActionTypes } from '../../redux/action-types';

export interface ISignupComponentProps {
    signUpFields: IUser;
    updateUsername: (value: string) => void;
    updatePassword: (value: string) => void;
    updateName: (value: string) => void;
    updateEmail: (value: string) => void;
    signUp: (signUpFields: IUser) => void;
}

class SignUpComponent extends Component<ISignupComponentProps, any> {
    constructor(props) {
        super(props);
    }

    render() {
        return this.getComponent();
    }

    getComponent() {
        const {
            signUpFields,
            updateUsername,
            updatePassword,
            updateEmail,
            updateName,
            signUp
        } = this.props;

        const result = (
            <div id='SignUp' className='box'>
                <div className='form-holder'>
                    <form>
                        <table>
                            <thead>

                            </thead>
                            <tbody>
                                <tr>
                                    <td>Full Name</td>
                                    <td><input value={signUpFields.name} type='text' placeholder='John Smith' required
                                        onChange={e => { updateName(e.target.value); }}
                                    /></td>
                                </tr>
                                <tr>
                                    <td>Email Address</td>
                                    <td><input value={signUpFields.email} type='email' placeholder='jsmith@gmail.com' required
                                        onChange={ e => { updateEmail(e.target.value); } }
                                    /></td>
                                </tr>
                                {/* username states: emptyUsername, usernameIsTaken, usernameHasInvalidCharacters, usernameIsValid */}
                                <tr>
                                    <td>Username</td>
                                    <td><input value={signUpFields.username} type='text' placeholder='Username' required
                                        onChange={e => { updateUsername(e.target.value); }}
                                    /></td>
                                </tr>
                                <tr>
                                    <td>password</td>
                                    <td><input value={signUpFields.password} type='password' placeholder='Password' required
                                        onChange={e => { updatePassword(e.target.value); }}
                                    /></td>
                                </tr>
                                <tr>
                                    <td colSpan={2} className='center'><p id='RegisterError' className='error'>&nbsp;</p></td>
                                </tr>
                                <tr>
                                    <td colSpan={2} className='center'><button
                                        onClick={ e => { e.preventDefault(); signUp(signUpFields); setTimeout(() => {this.sendNewUserToDB(); }); }}
                                    >Register</button> </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        );
        return result;
        // if the user is signed in and they submit the sign up form, log them out
    }

    sendNewUserToDB = () => async(dispatch) => {
        const res = await appClient.post('/users', {
            username: this.props.signUpFields.username,
            name:  this.props.signUpFields.name,
            password: this.props.signUpFields.password,
            email:  this.props.signUpFields.email,
            privateprofile: true,
        });
        console.log( 'res.data');
        console.log( res.data);
        console.log( 'this.props.signUpFields');
        console.log( this.props.signUpFields);
        res.data;
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
    }
}

const mapStateToProps = (state: IState) => {
    return {
        signUpFields: state.signUpFields
    };
};

const mapDispatchToProps = { ...actions };
export default connect(mapStateToProps, mapDispatchToProps)(SignUpComponent);