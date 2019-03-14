import React, { Component } from 'react';
import $ from 'jquery';
import * as Highcharts from 'highcharts';
import * as Exporting from 'highcharts/modules/exporting';
import * as ExportData from 'highcharts/modules/export-data';
import { Link } from 'react-router-dom';


interface IPostTimelineProps {
  posts: IPostItem[];
}

export interface IPostItem {
  text: string | undefined;
  title: string | undefined;
  img: any | undefined; // string | undefined;
}

export class PostTimelineComponent extends React.Component<IPostTimelineProps, any> {

  render() {

    const postItems = this.props.posts.map((post, id) => {
      if (post.img || post.text) {
        return <div key={id} className='post-item-container'>
          <div className='post-item-content'>
            {(post.title) ? <div className='post-item-label'><p>{post.title}</p></div> : undefined}
            <div className={`post-item-body-${(post.text) ? 'with-text' : 'no-text'}-${(post.img) ? 'with-img' : 'no-img'}`}>
              {(post.img) ? <div className='post-item-body-img-holder' ><img className={`bound-img post-item-img-${(post.text) ? 'with-text' : 'no-text'}`} src={post.img} /></div> : undefined}
              {(post.text) ? <div className='post-item-body-text-holder' ><p>{post.text}</p></div> : undefined}
            </div>
          </div>
        </div>;
      } else return;
    });

    return(
      <>
      <div id='posts-full'>
        <div id='posts-label'><strong>progress photos/videos (maybe doesnt need a label)</strong></div>
        <div id='posts-holder'>
          {postItems}
        </div>
      </div>
      </>
    );
  }
}