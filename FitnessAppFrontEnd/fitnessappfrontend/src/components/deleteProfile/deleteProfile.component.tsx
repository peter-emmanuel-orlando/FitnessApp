import React, { Component } from 'react';
import Modal from 'react-modal';
import { IState } from '../../redux/interfaces';
import * as actions from '../../redux/actions/delete-modal.actions';
import { connect } from 'react-redux';

interface IProps {
  username: string;
  active: boolean;
  open: () => void;
  onOpen?: () => void;
  close: () => void;
  onConfirm: (username: string) => void;
}

const modalStyle = {
  content: {
    backgroundColor: 'black',
    width: '35%',
    top: '50%',
    left: '50%',
    right: 'auto',
    bottom: 'auto',
    marginRight: '-50%',
    transform: 'translate(-50%, -50%)'
  },
  overlay: {
    backgroundColor: 'rgba(0, 0, 0, 0)'
  }
};

class DeleteProfileComponent extends Component<IProps, any> {
  constructor(props) {
    super(props);
  }

  render() {
    const { username, active, open, close, onConfirm } = this.props;
    return (
      <div className='delete-modal'>
        <button onClick={e => { e.preventDefault(); open(); }}>Delete</button>
        <Modal
          style={modalStyle}
          ariaHideApp={false}
          isOpen={active}
          onRequestClose={close}
        >
          <h2 style={{ textAlign: 'center', color: 'red' }} className='warning'>Warning</h2>
          <p style={{ textAlign: 'center' }}>Are you sure you want to delete your Profile?</p>
          <p style={{ textAlign: 'center' }}>THIS CANNOT BE UNDONE</p>
          <p>&nbsp;</p>
          <div style={{ width: '50%', margin: '0 auto' }}>
            <button style={{ width: '50%' }} onClick={e => {
              close();
            }}>NO</button>
            <button style={{ width: '50%' }} onClick={e => {
              e.preventDefault();
              onConfirm(username);
            }}>YES</button>
          </div>
        </Modal>
      </div>
    );
  }
}

const mapStateToProps = (state: IState) => {
  return {
    active: state.deleteModal.active,
    username: state.session.user.username
  };
};

const mapDispatchToProps = {
  open: actions.open,
  close: actions.close,
  onConfirm: actions.onConfirm
};

export default connect(mapStateToProps, mapDispatchToProps)(DeleteProfileComponent);