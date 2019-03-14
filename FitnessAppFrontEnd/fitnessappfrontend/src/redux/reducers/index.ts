import { combineReducers } from 'redux';
import { appReducer } from './app.reducer';
import { submitWorkoutReducer } from './submit-workout.reducer';
import { sessionReducer } from './session.reducer';
import { signUpReducer } from './sign-up.reducer';
import { allUsersReducer } from './all-user.reducer';
import { exerciseChartReducer } from './exerciseChart.reducer';
import { deleteModalReducer } from './delete-modal.reducer';
import { initialState } from '../initial-state';
import { ActionTypes } from '../action-types';

const reducer = combineReducers({
    app: appReducer,
    session: sessionReducer,
    workoutFields: submitWorkoutReducer,
    signUpFields: signUpReducer,
    users: allUsersReducer,
    exerciseChartState: exerciseChartReducer,
    deleteModal: deleteModalReducer
});

const rootReducer = (state = initialState, action: any) => {
    if (action.type === ActionTypes.LOGOUT) {
        return { ...action.payload };
    }
    return reducer(state, action);
};

export default rootReducer;