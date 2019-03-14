import React, { Component } from 'react';
import { connect } from 'react-redux';
import { IWorkouts, IState, ISession } from '../../redux/interfaces';
import * as foo from '../../redux/actions/workouts.action';
import { appClient } from '../../axios/app.client';


interface IProps {
    session: ISession;
    workoutFields: IWorkouts;
    updateRunning: (distance: number) => void;
    updateSwimming: (distance: number) => void;
    updateBiking: (distance: number) => void;
    updateCurls: (lbs: number, reps: number) => void;
    updateBenchPress: (lbs: number, reps: number) => void;
    updateDeadLift: (lbs: number, reps: number) => void;
    updateSquats: (reps: number) => void;
    updatePushUps: (reps: number) => void;
    updatePullUps: (reps: number) => void;
    updateSitUps: (reps: number) => void;
    submitWorkout: (e: any, workouts: IWorkouts) => void;
}

class SubmitExerciseComponent extends Component<IProps, any> {

    constructor(props: any) {
        super(props);
    }

    updateWorkout = async (exercise: string, amount: number) => {

        const workoutObject = {
            'units': amount,
            'occourred': Date.now(),
            'user': {
                'id': this.props.session.user.id,
            },
            'exercise': {
                'id': 1
            }
        };

        switch (exercise) {
            case ('running'):
                workoutObject.exercise.id = 1;
                break;
            case ('biking'):
                workoutObject.exercise.id = 2;
                break;
            case ('swimming'):
                workoutObject.exercise.id = 3;
                break;
            case ('curls'):

                workoutObject.exercise.id = 4;
                break;
            case ('deadlift'):
                workoutObject.exercise.id = 6;
                break;
            case ('squats'):
                workoutObject.exercise.id = 8;
                break;
            case ('benchpress'):

                console.log('the thing after');
                console.log(workoutObject);
                console.log('the thing after');
                workoutObject.exercise.id = 5;
                break;
            case ('pushups'):
                workoutObject.exercise.id = 7;
                break;
            case ('situps'):
                workoutObject.exercise.id = 9;
                break;
            case ('pullups'):
                workoutObject.exercise.id = 10;
                break;
            default:
                console.log('nothing');
                break;
        }


        const res = await appClient.post('/history', workoutObject);
    };

    sendWorkout = () => {
        const { workoutFields: workouts } = this.props;
        console.log('workouts benchpress');
        console.log(workouts.benchPress);
        console.log(workouts.benchPress.lbs * workouts.benchPress.reps);
        console.log('workouts benchpress');
        this.updateWorkout('running', workouts.running);
        this.updateWorkout('biking', workouts.biking);
        this.updateWorkout('swimming', workouts.swimming);
        this.updateWorkout('curls', workouts.curls.lbs * workouts.curls.reps);
        this.updateWorkout('deadlift', workouts.deadLift.lbs * workouts.deadLift.reps);
        this.updateWorkout('squats', workouts.squats);
        this.updateWorkout('benchpress', workouts.benchPress.lbs * workouts.benchPress.reps);
        this.updateWorkout('pushups', workouts.pushUps);
        this.updateWorkout('situps', workouts.sitUps);
        this.updateWorkout('pullups', workouts.pullUps);
    };

  render() {
    //   console.log('hey');
    //   console.log(this.props.user.userid);
    //   console.log('hey');
    //   console.log(this.props);
    //   console.log('hey');
    const {
        workoutFields,
        updateRunning, updateBiking, updateSwimming,
        updateCurls, updateBenchPress, updateDeadLift,
        updateSquats, updatePushUps, updatePullUps, updateSitUps
    } = this.props;

    return (
      <div id='submit' className='box one-column center'>
        <h1>Submit Exercise</h1>
          <div className='form-holder'>
              <form>
                  <table className='lined'>
                      <thead>

                      </thead>
                      <tbody>
                          <tr>
                                <td>Running</td>
                                <td><input type='number' value={workoutFields.running} step='.1' min='0' placeholder='0' name='Running' id='Running'
                                    onChange={e => { updateRunning(+e.target.value); }}
                                />Km</td>
                          </tr>
                          <tr>
                              <td>Biking</td>
                                <td><input type='number' value={workoutFields.biking} step='.1' min='0' placeholder='0' name='Biking' id='Biking'
                                    onChange={e => { updateBiking(+e.target.value); }}
                                />Km</td>
                          </tr>
                          <tr>
                              <td>Swimming</td>
                              <td><input  type='number' value={workoutFields.swimming} step='.1' min='0' placeholder='0' name='Swimming' id='Swimming'
                                    onChange={e => { updateSwimming(+e.target.value); }}
                                />Km</td>
                          </tr>
                          <tr>
                              <td>Curls</td>
                              <td>
                                <input type='number' step='.1' value={workoutFields.curls.lbs} min='0' placeholder='0' name='CurlLbs' id='CurlLbs'
                                    onChange={e => { updateCurls(+e.target.value, workoutFields.curls.reps); }}
                                />Lbs<br/> {
                                    workoutFields.curls.lbs > 0 ?
                                    (<><input type='number' step='1' value={workoutFields.curls.reps || '1'} min='1' placeholder='0' name='CurlReps' id='CurlReps'
                                        onChange={e => { updateCurls(workoutFields.curls.lbs, +e.target.value); }}
                                    />Reps</>) : (<></>)
                                }
                              </td>
                          </tr>
                          <tr>
                              <td>Bench Press</td>
                              <td>
                                    <input type='number' step='.1' value={workoutFields.benchPress.lbs} min='0' placeholder='0' name='BenchLbs' id='BenchLbs'
                                        onChange={e => { updateBenchPress(+e.target.value, workoutFields.benchPress.reps); }}
                                    />Lbs<br/> {
                                        workoutFields.benchPress.lbs > 0 ?
                                        (<> <input type='number' step='1' value={workoutFields.benchPress.reps || '1'} min='1' placeholder='0' name='BenchReps' id='BenchReps'
                                            onChange={e => { updateBenchPress(workoutFields.benchPress.lbs, +e.target.value); }}
                                        />Reps </>)  : (<></>)
                                    }
                              </td>
                          </tr>
                          <tr>
                              <td>Deadlift</td>
                              <td>
                                    <input type='number' step='.1' value={workoutFields.deadLift.lbs} min='0' placeholder='0' name='DeadliftLbs' id='DeadliftLbs'
                                        onChange={e => { updateDeadLift(+e.target.value, workoutFields.deadLift.reps); }}
                                    />Lbs<br/> {
                                        workoutFields.deadLift.lbs > 0 ?
                                        (<><input type='number' step='1' value={workoutFields.deadLift.reps || '1'} min='1' placeholder='0' name='DeadliftReps' id='DeadliftReps'
                                            onChange={e => { updateDeadLift(workoutFields.deadLift.lbs, +e.target.value); }}
                                        />Reps</>) : (<></>)
                                    }
                              </td>
                          </tr>
                          <tr>
                              <td>Pushups</td>
                                <td><input type='number' value={workoutFields.pushUps} step='1' min='0' placeholder='0' name='Pushups' id='Pushups'
                                    onChange={e => { updatePushUps(+e.target.value); }}
                                />Rep</td>
                          </tr>
                          <tr>
                              <td>Squats</td>
                                <td><input type='number' value={workoutFields.squats} step='1' min='0' placeholder='0' name='Squats' id='Squats'
                                    onChange={e => { updateSquats(+e.target.value); }}
                                />Rep</td>
                          </tr>
                          <tr>
                              <td>Situps</td>
                                <td><input type='number' value={workoutFields.sitUps} step='1' min='0' placeholder='0' name='Situps' id='Situps'
                                    onChange={e => { updateSitUps(+e.target.value); }}
                              />Rep</td>
                          </tr>
                          <tr>
                              <td>Pullups</td>
                                <td><input type='number' value={workoutFields.pullUps} step='1' min='0' placeholder='0' name='Pullups' id='Pullups'
                                    onChange={e => { updatePullUps(+e.target.value); }}
                              />Rep</td>
                          </tr>
                          <tr>
                              <td colSpan={2} className='center'><p id='WorkoutError' className='error'>&nbsp;</p></td>
                          </tr>
                          <tr>
                              <td colSpan={2} className='center'><input type='submit' value='Submit'
                                    onClick={e => {
                                  e.preventDefault();
                                  this.sendWorkout();
                                  this.props.submitWorkout(e, workoutFields);
                                 }
                              }/></td>
                          </tr>
                      </tbody>
                  </table>
              </form>
          </div>
      </div>
    );
  }
}

const mapStateToProps = (state: IState) => {
    return {
        workoutFields: state.workoutFields,
        session: state.session
    };
};
const mapDispatchToProps = { ...foo };
export default connect(mapStateToProps, mapDispatchToProps)(SubmitExerciseComponent);