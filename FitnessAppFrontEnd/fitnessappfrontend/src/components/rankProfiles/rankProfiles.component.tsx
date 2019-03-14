import React, { Component } from 'react';
import { Link } from 'react-router-dom';
const friendPhoto1 = require('../../resources/placeholder-friend-photo-1.jpg');
const profilePic = require('../../resources/default-profile-pic.jpg');
import { appClient } from '../../axios/app.client';

interface IInspirationsProps {
    friendInfo: IFriendLinkInfo[];
}

export interface IFriendLinkInfo {
  picURL: any; // string;
  profileLinkURL: string;
}

export class RankProfilesComponent extends React.Component<IInspirationsProps, any> {

    constructor(props) {
        super(props);
        this.state = {
            displaySearch: false,
            searchStr: '',
            searchArr: [
                { picURL: friendPhoto1, profileLinkURL: '' },
                { picURL: friendPhoto1, profileLinkURL: '' },
                { picURL: friendPhoto1, profileLinkURL: '' }
              ]
        };
    }

    updateSquares = () => {
        this.setState({
          ...this.state
        },
        async () => {
            try {
                const res = await appClient.get('/users/rank/subscribers');
                console.log(res.data);
                this.setState({
                    searchArr: res.data
                });
            } catch (err) {
                console.log(err);
            }
        }
      );
    }


  render() {
    const friendArr = this.state.searchArr;

    const inspirationSquares = friendArr.map((friend) => {
        return (
          <Link key={friend.id} to={`/user/${friend.username}`}>
            <div className='inspiration-square'>
              <img src={friend.pictureUrl || profilePic} />
            </div>
          </Link>
        );
      });

    return(
      <>
        <div id='inspirations-full' className='box one-column center'>
          <div id='inspirations-label'>
            <strong>
                <label>Top Ranked By Subscribers</label>
                {/* <br/>
                <select defaultValue='rank' name='searchBy' id='searchBy'>
                    <option value='rank'>Followers</option>
                    <option value='running'>Running</option>
                    <option value='biking'>Biking</option>
                    <option value='swimming'>Swimming</option>
                    <option value='curl'>Curls</option>
                    <option value='bench-press'>Bench-Press</option>
                    <option value='deadlift'>Deadlift</option>
                    <option value='pushup'>Push-Up</option>
                    <option value='squat'>Squat</option>
                    <option value='situp'>Sit-Up</option>
                    <option value='pullup'>Pull-Up</option>
                </select> */}
            </strong>
          </div>
          <div id='inspirations-rank-holder' style={{'width': '100%', 'height': '100%'}}>
            {inspirationSquares}
          </div>
        </div>
      </>
    );
  }

  componentDidMount() {
    this.updateSquares();
  }

}


