import React from 'react';
import LoginComponent from '../login/login.component';
import SignUpComponent from '../signUp/signUp.component';
import { ProfileComponent } from '../profile/profile.component';
import { IState, IApp } from '../../redux/interfaces';
import { connect } from 'react-redux';
import { RouteComponentProps } from 'react-router';

interface ISplashPageComponentProps extends RouteComponentProps {
  app: IApp;
}

export class SplashPageComponent extends React.Component<ISplashPageComponentProps, any> {
  constructor(props) {
      super(props);
  }
  render() {
    return this.getComponent();
  }

  getComponent() {
    const { isLoggedIn } = this.props.app;
    if (isLoggedIn) {
      return (
        <div id='Splash'>
          <ProfileComponent {...this.props}/>
        </div>
      );
    } else {
      return (
      <div id='Splash'>
        <div className='two-column'>
          <div className='ambi-side'>
            <LoginComponent />
          </div>
          <div className='ambi-side'>
            <SignUpComponent {...this.props} />
          </div>
        </div>
      </div>
      );
    }
  }
}

const mapStateToProps = (state: IState) => {
  return { app: state.app };
};

export default connect(mapStateToProps)(SplashPageComponent);