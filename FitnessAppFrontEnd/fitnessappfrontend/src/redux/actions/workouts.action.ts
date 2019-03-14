import { ActionTypes } from '../action-types';
import { IWorkouts } from '../interfaces';

export const submitWorkout = (e: any, workouts: IWorkouts) => {
    e.preventDefault();
    return {
        type: ActionTypes.SUBMIT_WORKOUTS,
        payload: { ...workouts }
    };
};

export const updateRunning = (distance: number) => {
    return {
        type: ActionTypes.UPDATE_RUNNING,
        payload: distance
    };
};
export const updateSwimming = (distance: number) => {
    return {
        type: ActionTypes.UPDATE_SWIMMING,
        payload: distance
    };
};
export const updateBiking = (distance: number) => {
    return {
        type: ActionTypes.UPDATE_BIKING,
        payload: distance
    };
};
export const updateCurls = (lbs: number, reps: number) => {
    return {
        type: ActionTypes.UPDATE_CURLS,
        payload: { lbs, reps }
    };
};
export const updateBenchPress = (lbs: number, reps: number) => {
    return {
        type: ActionTypes.UPDATE_BENCH_PRESS,
        payload: { lbs, reps }
    };
};
export const updateDeadLift = (lbs: number, reps: number) => {
    return {
        type: ActionTypes.UPDATE_DEAD_LIFT,
        payload: { lbs, reps }
    };
};
export const updateSquats = (reps: number) => {
    return {
        type: ActionTypes.UPDATE_SQUATS,
        payload: reps
    };
};
export const updatePushUps = (reps: number) => {
    return {
        type: ActionTypes.UPDATE_PUSH_UPS,
        payload: reps
    };
};
export const updatePullUps = (reps: number) => {
    return {
        type: ActionTypes.UPDATE_PULL_UPS,
        payload: reps
    };
};
export const updateSitUps = (reps: number) => {
    return {
        type: ActionTypes.UPDATE_SIT_UPS,
        payload: reps
    };
};