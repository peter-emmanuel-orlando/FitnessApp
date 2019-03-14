import { ActionTypes } from '../action-types';
import { initialState } from '../initial-state';

export const submitWorkoutReducer = (state: any = initialState.workoutFields, action: any) => {
    switch (action.type) {
        case ActionTypes.SUBMIT_WORKOUTS:
            console.log('Submitted Workouts: ' + action.payload);
            return {
                ...action.payload
            };

        case ActionTypes.UPDATE_RUNNING:
            return {
                ...state,
                running: action.payload
            };

        case ActionTypes.UPDATE_SWIMMING:
            return {
                ...state,
                swimming: action.payload
            };

        case ActionTypes.UPDATE_BIKING:
            return {
                ...state,
                biking: action.payload
            };

        case ActionTypes.UPDATE_CURLS:
            return {
                ...state,
                curls: { ...action.payload }
            };

        case ActionTypes.UPDATE_BENCH_PRESS:
            return {
                ...state,
                benchPress: { ...action.payload }
            };

        case ActionTypes.UPDATE_DEAD_LIFT:
            return {
                ...state,
                deadLift: { ...action.payload }
            };

        case ActionTypes.UPDATE_SQUATS:
            return {
                ...state,
                squats: action.payload
            };

        case ActionTypes.UPDATE_PUSH_UPS:
            return {
                ...state,
                pushUps: action.payload
            };

        case ActionTypes.UPDATE_PULL_UPS:
            return {
                ...state,
                pullUps: action.payload
            };

        case ActionTypes.UPDATE_SIT_UPS:
            return {
                ...state,
                sitUps: action.payload
            };

        default:
            return state;
    }
};