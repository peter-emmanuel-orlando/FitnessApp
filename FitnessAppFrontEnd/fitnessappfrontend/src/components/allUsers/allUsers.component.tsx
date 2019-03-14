import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import { IUser } from '../../redux/interfaces';
import { IState } from '../../redux/interfaces';
import { connect } from 'react-redux';
import { getUsers } from '../../redux/actions/get-users.action';


interface IProps {
  users: IUser[];
  getUsers: () => void;
}

class AllUsersComponent extends Component<IProps, any> {
  constructor(props: any) {
    super(props);
  }

  componentDidMount() {
    this.props.getUsers();
  }

  render() {
    const { users } = this.props;
    return (
      <div id='allUsers' className='box one-column center'>
        <h1>All Users</h1>
        <table className='lined'>
          <thead>
            <tr>
              <th>Username</th>
              <th>Name</th>
              <th>Email</th>
            </tr>
          </thead>
          <tbody>
            {users.map(function (e, id) {
              return (
                <tr key={id}>
                  <td>
                    {/* <Link to={'admin/users/edit/' + e.username}>{e.username}</Link> */}
                    <Link to={'/user/' + e.username}>{e.username}</Link>
                  </td>
                  <td>{e.name}</td>
                  <td><a href={'mailto:' + e.email}>{e.email}</a></td>
                </tr>
              );
            })}
          </tbody>
        </table>
      </div>
    );
  }
}

const mapStateToProps = (state: IState) => {
  return {
    users: state.users
  };
};

const mapDispatchToProps = {
  getUsers
};

export default connect(mapStateToProps, mapDispatchToProps)(AllUsersComponent);