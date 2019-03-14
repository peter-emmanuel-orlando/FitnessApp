import React, { Component } from 'react';
import { IUser } from '../../redux/interfaces';

interface IProps {
  user: IUser;
}

export class EditUserComponent extends Component<IProps, any> {
  render() {
    const { username, name, email } = this.props.user;
    return (
        <>
          <form>
            <label htmlFor='name'>Full Name</label>
            <input type='text' name='name' placeholder={name}/>

            <label htmlFor='username'>Username</label>
            <input type='text' name='username' placeholder={username} />
          </form>
        </>
    );
  }
}
