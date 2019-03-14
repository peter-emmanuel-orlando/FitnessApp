import React from 'react';
import { ISession, ICredentials, IState } from '../../redux/interfaces';
import { connect } from 'react-redux';
import { updateCredentials } from '../../redux/actions/session.action';
import { login } from '../../redux/actions/session.action';
import { getCredentialsCookie, setCredentialsCookie } from '../../resources/htmlCookie.util';

interface ILoginComponentProps {
    session: ISession;
    updateCredentials: (username: string, password: string) => void;
    login: (credentials: ICredentials) => void;
}
export class LoginComponent extends React.Component<ILoginComponentProps, any> {
    constructor(props) {
        super(props);
    }

    componentDidMount() {
    }

    render() {
        const credentials = getCredentialsCookie();

        if (credentials) {
            console.log('tried to log in with credentials');
            this.props.login(credentials);
        }

        return this.getComponent();
    }

    getComponent() {
        const { session, updateCredentials, login } = this.props;
        const result = (
            <div id='login' className='box'>
                <div className='form-holder'>
                    <form>
                        <table>
                            <thead>

                            </thead>
                            <tbody>
                                <tr>
                                    <td>Username:</td>
                                    <td><input type='text' placeholder='Enter username' required onChange={e => {
                                        updateCredentials(e.target.value, session.credentials.password);
                                    }} /></td>
                                </tr>
                                <tr>
                                    <td>Password:</td>
                                    <td><input type='password' placeholder='Enter password' required onChange={e => {
                                        updateCredentials(session.credentials.username, e.target.value);
                                    }}/></td>
                                </tr>
                                <tr>
                                    <td colSpan={2} className='center'><p id='LoginError' className='error'>&nbsp;</p></td>
                                </tr>
                                <tr>
                                    <td colSpan={2} className='center'><button onClick={e => {
                                        e.preventDefault();
                                        login(session.credentials);
                                    }}>Login</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        );
        return result;
    }
}

const mapStateToProps = (state: IState) => {
    return {
        session: state.session
    };
};

const mapDispatchtoProps = {
    updateCredentials,
    login
};

export default connect(mapStateToProps, mapDispatchtoProps)(LoginComponent);