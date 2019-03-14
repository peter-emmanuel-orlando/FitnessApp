import React, { Component } from 'react';
const profilePic = require('../../resources/default-profile-pic.jpg');
import SubscribeEditComponent from './subscribeEdit/subcribeEdit.component';
import { ExerciseChartComponent }  from './exerciseChart/exerciseChart.component';
import { InspirationsListComponent } from './inspirations/inspirations.component';
import { TakePicComponent } from '../takePicComponent/takePic.component';
import { store } from '../../redux/Store';
import { IUser, IState } from '../../redux/interfaces';
import { RouteComponentProps } from 'react-router';
import { appClient } from '../../axios/app.client';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

/*
A profile is the home page for the average user.
The profile gives an overview of ...
  -*a profile picture
  -*basic info/stats
  -*a short about me (goals)
  -last 3 excersises
  -a section to add a new excersise to history
  -top 3 friends
  -show a graph displaying ratios of types of excersise, with lables

*/
interface IProfileComponentState {
  showTakePicModal: boolean;
  photoURL: string;
  viewed: IUser | undefined;
}

export class ProfileComponent extends Component<RouteComponentProps, IProfileComponentState> {

  constructor(props) {
    super(props);
    this.state = {showTakePicModal: false, photoURL: '', viewed: undefined};
  }

  componentDidMount() {
    this.setViewed();
  }
  componentDidUpdate (prevProps) {
    if (prevProps.location.key !== this.props.location.key) {
      this.setViewed();
    }
  }

  setViewed = async () => {
    const username = this.props.match.params && (this.props.match.params as any).username;
    console.log(username);
    let viewedUser = store.getState().session.user;
    if (username) {
      const possibleViewed = (await appClient.get(`/users/username/${username}`)).data;
      if (possibleViewed) viewedUser = possibleViewed;
      viewedUser.name = viewedUser.fullName;
    }
    console.log('viewing...');
    console.log(viewedUser);
    this.setState({...this.state, viewed: viewedUser});
  }

  render() {
    let result = <></>;
    if (this.state.viewed)
      result = this.getComponent();
    return result;
  }

  getComponent() {
    const viewed = this.state.viewed as IUser;
    if (!viewed) return <></>;
    const profilePicSrc = viewed.pictureUrl || profilePic;
    return(
      <>
        {/* this holds everything */}
        <div id='all-profile-component' className='two-column'>
          {/* this is the profile and personal info section */}
          <div id='left-side'>
            <div id='sticky'>
              <div id='profile-pic-full'>
                <div id='nickname-label' className='label center'><strong>{viewed.name}</strong></div>
                <div id='profile-pic-holder' className='fill-all' style={{position: 'relative'}}>
                  <img id='profile-pic' className='bound-img' src={profilePicSrc}/>
                  <div id='pic-capture-buttons' style={{position: 'absolute', bottom: '1rem', right: '1rem'}}>
                        <button id='take-photo' onClick={() => {this.setState({...this.state, showTakePicModal: true}); }}>Snap Photo</button>
                        <button id='upload-photo' onClick={() => {}}>
                          <label>
                            Custom Upload
                            <input type='file'style={{display: 'none'}}/>
                          </label>
                        </button>
                    </div>
                </div>
              </div>
              <div className='box'>
                <SubscribeEditComponent viewed={this.state.viewed as IUser}  />
              </div>
            </div>
          </div>
          <div id='right-side'>
            <ExerciseChartComponent viewed={this.state.viewed as IUser}  />
            <InspirationsListComponent viewed={this.state.viewed as IUser} />
          </div>
        </div>
        {(this.state.showTakePicModal) ? <div id='cover-everything'><div id='take-pic-bounding'><TakePicComponent closeModal={this.closeModal} /></div></div> : <></>}
      </>
    );
  }

  closeModal = () => {
    this.setState({...this.state, showTakePicModal: false});
  }
  uploadNewPhotoURL = (newPhotoURL) => {

  }
}

const mapStateToProps = (state: IState) => {
  return {
    app: state.app,
    viewer: state.session.user
  };
};

export default connect(mapStateToProps)(ProfileComponent);