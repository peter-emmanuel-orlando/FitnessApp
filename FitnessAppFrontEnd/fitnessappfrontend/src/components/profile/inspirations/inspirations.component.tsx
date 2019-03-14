import React, { Component } from 'react';
import $ from 'jquery';
import * as Highcharts from 'highcharts';
import * as Exporting from 'highcharts/modules/exporting';
import * as ExportData from 'highcharts/modules/export-data';
import { Link } from 'react-router-dom';
import { store } from '../../../redux/Store';
import { IUser } from '../../../redux/interfaces';
const defaultProfilePic = require('../../../resources/default-profile-pic.jpg');
import { appClient } from '../../../axios/app.client';


interface IInspirationsProps {
  viewed: IUser;
}

interface IInspirationsState {
  displaySearch: boolean;
  searchStr: string;
  searchArr: any[];
}

export class InspirationsListComponent extends React.Component<IInspirationsProps, IInspirationsState> {

    constructor(props) {
        super(props);
        this.state = {
            displaySearch: false,
            searchStr: '',
            searchArr: []
        };
    }

    updateSquares = async (e) => {
        this.setState({
            ...this.state,
            searchStr: e.target.value
        },
            async () => {
            if (this.state.searchStr !== '') {
                try {
                    const res = await appClient.get('/users/search/' + this.state.searchStr);
                    console.log('res.data');
                    console.log(res.data);
                    res.data.splice(6);
                    this.setState({
                        displaySearch: true,
                        searchArr: res.data
                    });
                } catch (err) {
                    console.log(err);
                }
            } else {
                this.setState({
                    displaySearch: false,
                    searchArr: []
                });
            }
        }
        );
    }

  render() {
    let result = <></>;
    if (this.props.viewed)
      result = this.getComponent();
    return result;
  }

  getComponent() {

    const friendArr: any[] = this.state.displaySearch === false ?
        (this.props.viewed as any).followedUsers : this.state.searchArr;

    let inspirationSquares = friendArr.map((friend) => {
      return (
        <Link key={friend.id} to={`/user/${friend.username}`}>
           <div className='inspiration-square'  >
               <img src={friend.pictureUrl || defaultProfilePic} />
           </div>
        </Link>
      );
    });
    if (friendArr.length <= 0) inspirationSquares = [<><p>You haven't followed any inspirations yet!</p></>];


    return(
      <>
        <div id='inspirations-full'>
          <div id='inspirations-label'>
            <strong>INSPIRATIONS</strong>
            <span id='inspirations-search'>
                <span><strong>Search: </strong></span>
                <input  onChange={(e) => {this.updateSquares(e); }} type='text' />
            </span>
          </div>
          <div id='inspirations-holder'>
            {inspirationSquares}
          </div>
        </div>
      </>
    );
  }

}



