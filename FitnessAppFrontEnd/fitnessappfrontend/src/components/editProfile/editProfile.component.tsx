import React, { Component } from 'react';
import { IState, IApp, IUser } from '../../redux/interfaces';
import { connect } from 'react-redux';
import * as actions from '../../redux/actions/sign-up.action';
import { updateUser } from '../../redux/actions/edit-profile.actions';
import DeleteProfileComponent from '../deleteProfile/deleteProfile.component';

interface IEditProfileProps {
  user: IUser;
  fields: IUser;
  updateUsername: (value: string) => void;
  updatePassword: (value: string) => void;
  updateName: (value: string) => void;
  updateEmail: (value: string) => void;
  updateIsPrivate: (value: boolean) => void;
  updateUser: (fields: IUser) => void;
  // deleteUser: (username: string) => void;
}

class EditProfileComponent extends Component<IEditProfileProps, any> {
  render() {
    const { user, fields } = this.props;
    return (
      <>
        <form className='edit-profile'>
          <label htmlFor='name'>Full Name</label>
          <input type='text' name='name' defaultValue={fields.name} onChange={e => {
            this.props.updateName(e.target.value);
          }} />

          <label htmlFor='username'>Username</label>
          <input type='text' name='username' defaultValue={fields.username} onChange={e => {
            this.props.updateUsername(e.target.value);
          }} />

          <label htmlFor='email'>Email</label>
          <input type='email' name='email' defaultValue={fields.email} onChange={e => {
            this.props.updateEmail(e.target.value);
          }} />

          <div style={{ margin: '5px 0' }}>
            <input type='checkbox' name='is-private' defaultChecked={fields.private} onChange={e => {
              this.props.updateIsPrivate(e.target.checked);
            }} />
            <label htmlFor='is-private'>Private Profile</label><br />
          </div>

          <button onClick={e => {
            e.preventDefault();
            this.props.updateUser(this.props.fields);
          }}>Save</button>

          <DeleteProfileComponent />
        </form>
      </>
    );
  }
}

const mapStateToProps = (state: IState) => {
  return {
    user: state.session.user,
    fields: state.signUpFields
  };
};
const mapDispatchToProps = {
  ...actions,
  updateUser
};

export default connect(mapStateToProps, mapDispatchToProps)(EditProfileComponent);
