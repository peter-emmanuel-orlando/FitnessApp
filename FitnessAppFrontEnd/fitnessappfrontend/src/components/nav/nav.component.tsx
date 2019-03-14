import React from 'react';
const logo = require('../../resources/fitness-icon.png');
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';
import { IState, IApp, IUser } from '../../redux/interfaces';
import { logout } from '../../redux/actions/session.action';


interface INavComponentProps {
  app: IApp;
  user: IUser;
  logout: (e: any) => void;
}

class NavComponent extends React.Component<INavComponentProps, any> {
    constructor(props) {
        super(props);
    }

    render() {
        return this.getComponent();
    }

    getComponent() {
        let userElement = <></>;
        let adminElement = <></>;
        let logoutElement = <></>;
        const { app, logout, user } = this.props;


        if (app.isLoggedIn) {
            const usersFullNameString = `${'firstName'} ${'lastname'}`;
            userElement = (
                <>
                    <li className='nav-item'>
                        <p className='nav-link' id='usersFullName'>{(user ? user.name : '')}</p>
                    </li>
                    <li className='nav-item'>
                        <Link to='/' className='nav-link'>Home</Link>
                    </li>
                    <li className='nav-item'>
                        <Link to='/submit' className='nav-link'>Submit Workout</Link>
                    </li>
                    <li className='nav-item'>
                        <Link to='/rankings' className='nav-link'>Top Ranked</Link>
                    </li>
                </>
            );
            logoutElement = (
                <li className='nav-item'>
                    <Link to='/logout' className='nav-link' href='#' onClick={logout}>Log out</Link>
                </li>
            );
        }

        if (app.isLoggedIn && app.isAdmin ) {
            adminElement = (
                <li className='nav-item'>
                    <Link to='/admin/users' className='nav-link'>User Management</Link>
                </li>
            );
        }

        const result = (
            <div id='nav'>
                <a href='revature.com'><img id='nav-logo' src={logo} /></a>
                <div id='nav-items'>
                    <ul className='nav justify-content-end'>
                        {userElement}
                        {adminElement}
                        {logoutElement}
                    </ul>
                </div>
            </div>
        );
        return result;
    }
}

const mapStateToProps = (state: IState) => {
    return {
        app: state.app,
        user: state.session.user
    };
};

const mapDispatchToProps = { logout };

export default connect(mapStateToProps, mapDispatchToProps)(NavComponent);