import React, { Component } from 'react';
import $ from 'jquery';
import * as Highcharts from 'highcharts';
import * as Exporting from 'highcharts/modules/exporting';
import * as ExportData from 'highcharts/modules/export-data';
import { Link } from 'react-router-dom';


interface IMyGoalsListProps {
  goals: IGoal[];
}

export interface IGoal {
  isCurrentGoal: boolean;
  goalText: string;
}

export class MyGoalsListComponent extends React.Component<IMyGoalsListProps, any> {

  render() {

    const goalRows = this.props.goals.map((goal, id) => {
      return <div key={id} className={'goal-item goal-item-' + (goal.isCurrentGoal) ? 'current' : 'past' }>
        <span className='goal-item-label'>GOAL: </span>
        <span className='goal-item-text'>{goal.goalText}</span>
      </div>;
    });

    return(
      <>
        <div id='my-goals-full'>
          <div id='my-goals-label'><strong>MY GOALS</strong></div>
          <div id='my-goals-holder'>
            <div className='goal-item'>
              <input id='new-goal-input' placeholder='add a new goal' />
            </div>
            {goalRows}
          </div>
        </div>
      </>
    );
  }
}