import React, { Component } from 'react';
import { BrowserRouter, Switch, Route, Redirect } from 'react-router-dom';
import NavComponent from './components/nav/nav.component';
import SplashPageComponent from './components/splashPage/splashPage.component';
import AllUsersComponent from './components/allUsers/allUsers.component';
import { EditUserComponent } from './components/editUser/editUser.component';
import EditProfileComponent from './components/editProfile/editProfile.component';
import DeleteProfileComponent from './components/deleteProfile/deleteProfile.component';
import { RankProfilesComponent } from './components/rankProfiles/rankProfiles.component';
import SubmitExerciseComponent from './components/submitExercise/submitExercise.component';
import { connect } from 'react-redux';
import { IState, IApp } from './redux/interfaces';
import ProfileComponent from './components/profile/profile.component';

interface IAppProps {
    app: IApp;
}

class MainComponent extends Component<IAppProps, any> {
    constructor(props) {
        super(props);
    }

    render() {
        const { isAdmin, isLoggedIn } = this.props.app;
        return (
            <div id='content-holder'>
                <BrowserRouter>
                    <>{/*browserRouter expect only 1 child element that contains all routes*/}
                        <NavComponent />
                        <div id='main'>
                            <Switch>
                                <Route exact path='/' component={SplashPageComponent} />
                                {/* regularComponents */}
                                {
                                    // Admin
                                    (isLoggedIn && isAdmin) ?
                                        <Switch>
                                            <Route exact path='/admin/users' component={AllUsersComponent} />
                                            <Route path='/admin/users/edit/:username' component={ EditUserComponent} />
                                            {/* these are shared between admin and users, however more options may be availible to admin */}
                                            <Route path='/user/:username' component={ProfileComponent}/>
                                            {/* perhaps a button from the profile component rather than a link from the main router */}
                                            <Route path='/profile/edit' component={EditProfileComponent} />
                                            <Route path='/profile/delete' component={DeleteProfileComponent} />
                                            {/* changed to rank */}
                                            <Route path='/rankings' component={RankProfilesComponent} />
                                            {/* maybe this works like facebook where theres a "new post" section in your feed, rather than this being its own page */}
                                            <Route path='/submit' component={SubmitExerciseComponent } />
                                            <Redirect to='/' />
                                        </Switch>
                                        :
                                        // Not Admin
                                        <>
                                            {isLoggedIn ?
                                                <Switch>
                                                    {/* these are shared between admin and users, however more options may be availible to admin */}
                                                    <Route path='/user/:username' component={ProfileComponent} />
                                                    {/* perhaps a button from the profile component rather than a link from the main router */}
                                                    <Route path='/profile/edit' component={EditProfileComponent} />
                                                    <Route path='/profile/delete' component={DeleteProfileComponent} />
                                                    {/* changed to rank */}
                                                    <Route path='/rankings' component={RankProfilesComponent} />
                                                    {/* maybe this works like facebook where theres a "new post" section in your feed, rather than this being its own page */}
                                                    <Route path='/submit' component={SubmitExerciseComponent} />
                                                    <Redirect to='/' />
                                                </Switch>
                                                :
                                                // not logged in
                                                <Redirect to='/' />
                                            }
                                        </>
                                }
                            </Switch>
                            <footer style={{textAlign: 'center'}} id='footer'>
                                <small>Icons made by <a href='https://flat-icons.com/' title='Flat Icons'> Flat Icons </a> from <a href='https://www.flaticon.com/' title='Flaticon'> www.flaticon.com </a> is licensed by <a href='http://creativecommons.org/licenses/by/3.0/' title='Creative Commons BY 3.0' target='_blank'> CC 3.0 BY </a><br/>
                                &copy; {new Date().getFullYear()}. Fitness App.</small>
                            </footer>
                        </div>
                    </>
                </BrowserRouter>
            </div>
        );
    }
}

const mapStateToProps = (state: IState) => {
    return { app: state.app };
};

export default connect(mapStateToProps)(MainComponent);