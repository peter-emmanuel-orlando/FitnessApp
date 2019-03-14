import { ActionTypes } from '../action-types';
import { initialState } from '../initial-state';

export const exerciseChartReducer = (state = initialState.exerciseChartState, action: any) => {
    switch (action.type) {
        case ActionTypes.UPDATE_Exercise_CHART_COMPONENT_STATE:
            return action.payload;
        default:
            return state;
    }
};