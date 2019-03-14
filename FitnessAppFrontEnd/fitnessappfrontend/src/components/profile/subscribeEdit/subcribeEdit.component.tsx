import React from 'react';
import { IUser, IState } from '../../../redux/interfaces';
import SubscribeComponent from '../subscribe/subscribe.component';
import EditProfileComponent from '../../editProfile/editProfile.component';
import { connect } from 'react-redux';

interface ISubscribeEditProps {
  viewed: IUser;
  viewer: IUser;
}

interface ISubscribeEditState {
}

export class SubscribeEditComponent extends React.Component<ISubscribeEditProps, ISubscribeEditState> {

    constructor(props) {
        super(props);
    }

  render() {
    return this.getComponent();
  }

  getComponent() {
    if (this.props.viewed.username === this.props.viewer.username) {
      return <EditProfileComponent />;
    } else {
      return <SubscribeComponent viewed={this.props.viewed as IUser} />;
    }
  }
}

const mapStateToProps = (state: IState) => {
    return {
        viewer: state.session.user
    };
};

export default connect(mapStateToProps)(SubscribeEditComponent);