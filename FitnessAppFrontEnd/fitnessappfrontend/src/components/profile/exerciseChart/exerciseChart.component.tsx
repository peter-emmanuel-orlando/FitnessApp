import React, { Component } from 'react';
import $ from 'jquery';
import * as Highcharts from 'highcharts';
import * as Exporting from 'highcharts/modules/exporting';
import * as ExportData from 'highcharts/modules/export-data';
import { IUser } from '../../../redux/interfaces';
import { appClient } from '../../../axios/app.client';
import { store } from '../../../redux/Store';
import { async } from 'q';
import Axios from 'axios';
import workoutInfo from '../../../resources/workoutResourcesModule';

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
interface IExerciseChartProps {
  viewed: IUser;
}

interface IExerciseChartState {
  workoutType: string;
  exerciseData: number[][];
}


export class ExerciseChartComponent extends React.Component<IExerciseChartProps, IExerciseChartState> {


  constructor(props) {
    super(props);
    this.state = {
      workoutType: 'Running',
      exerciseData: [[0, 0], [1, 0]]
    };
  }

  componentDidMount() {
    this.fetchChartData(this.props.viewed.id, this.state.workoutType).then((value) => {
      const hc = this.setUpChart(value);
      // push to end of stack so chart is done with its render before trying to reflow it
      hc.reflow();
    });
  }


  fetchChartData = async (userId: number, exerciseType: string): Promise<IExerciseChartState> => {
    const res = await appClient.get(`/history/user/${userId}/exercise/${exerciseType}`);
    let result = { workoutType: 'none', exerciseData: [[0, 1], [9999999999999, 1]] };

    console.log(res.data);
    if (res.data) {
      const workoutType = exerciseType;
      const exerciseData = (res.data as any[]).map((element) => {
        return [element.occourred, element.units];
      });
      result = {workoutType: workoutType, exerciseData: exerciseData};
    }
    return result ;
  }

  setUpChart = ( workoutHistory: any): Highcharts.Chart => {

    workoutHistory.exerciseData = (workoutHistory.exerciseData as number[][]).sort((a, b) => {return +a[0] - +b[0]; });
    // console.log('workoutHistory');
    // console.log(workoutHistory);

    const textStyle = {
      style: {
        fontFamily: 'monospace',
        color: 'rgba(225, 255, 255, 1)'
      }
    };

    return Highcharts.chart( {
      chart: {
        renderTo: 'history-graph',
        zoomType: 'x',
        ...textStyle,
        backgroundColor: {
          linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
          stops: [
              [0, 'rgba(100, 25, 255, .0)'],
              [1, 'rgba(200, 200, 255, .0)']
          ]
        }
      },
      title: {
        useHTML: true,
        text: '',
        ...textStyle
      },
      subtitle: {
        text: workoutHistory.workoutType + ' History: ' + ((document.ontouchstart === undefined) ? 'Click and drag in the plot area to zoom in' : 'Pinch the chart to zoom in'),
        ...textStyle
      },
      xAxis: {
        type: 'datetime',
        labels: {...textStyle}
      },
      yAxis: {
        title: {
          text: 'score',
        ...textStyle,
        },
        labels: {...textStyle}
      },
      legend: {
        enabled: false
      },
      plotOptions: {
        area: {
          fillColor: {
            linearGradient: {
              x1: 0,
              y1: 0,
              x2: 0,
              y2: 1
            },
            stops: [
              [0, 'rgba(100, 25, 255, .9)'],
              [1, 'rgba(127, 255, 212, .6)']
            ]
          },
          marker: {
            radius: 2
          },
          lineWidth: 1,
          states: {
            hover: {
              lineWidth: 1
            }
          }
        }
      },

      series: [{
        type: 'area',
        name: workoutHistory.workoutType + ' score',
        data: workoutHistory.exerciseData as any
      }]
    });
  }



  render() {
    const workoutHistory = this.state;
    const workoutIconButtons: any[] = [];

    for (const key in workoutInfo) {
      if (workoutInfo.hasOwnProperty(key)) {
        const icon = workoutInfo[key];

        if ((key.toLowerCase() === workoutHistory.workoutType.toLowerCase())) {
          // console.log('key.toLowerCase()');
          // console.log(key.toLowerCase());
        }
        // console.log('workoutHistory.workoutType.toLowerCase()')
        // console.log(workoutHistory.workoutType.toLowerCase())
        // console.log('key.toLowerCase() === workoutHistory.workoutType.toLowerCase()')
        // console.log(key.toLowerCase() === workoutHistory.workoutType.toLowerCase())
        // console.log("(key.toLowerCase() === workoutHistory.workoutType.toLowerCase())?'selected' : ''")
        // console.log((key.toLowerCase() === workoutHistory.workoutType.toLowerCase())?'selected' : '')

        const btnClasses: string = (key.toLowerCase() === workoutHistory.workoutType.toLowerCase()) ? 'selected' : '';
        const btnFunc = () => {
          this.setState({...this.state, workoutType: key.toLowerCase()},
          () => {
            this.fetchChartData(this.props.viewed.id, this.state.workoutType).then((value) => {
              const hc = this.setUpChart(value);
              // push to end of stack so chart is done with its render before trying to reflow it
              setTimeout(() => {
                hc.reflow();
              });
            });
          });
        };
        workoutIconButtons.push(<button onClick={btnFunc} className={'btn ' + btnClasses}><img src={icon} /></button>);
      }
    }
    const workoutTypeSelector = <div id='workout-type-container'><div id='workout-type-selector'>{workoutIconButtons}</div></div>;
    return(
      <>
        <div id='history-full'>
          <div id='history-label' className='center'><strong>MY PROGRESS</strong></div>
          {workoutTypeSelector}
          <div id='history-holder'>
            <div id='history-graph'></div>
          </div>
        </div>
      </>
    );
  }

}








