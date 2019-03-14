export interface IApp {
    isLoggedIn: boolean;
    isAdmin: boolean;
}

export interface ICredentials {
    username: string;
    password: string;
}

export interface IUser {
    username: string;
    name: string;
    password?: string;
    email: string;
    id: number;
    role: string;
    private: boolean;
    pictureUrl?: string;
    followedUsers?: IUser[];
}

// export interface IUser extends IUser {
//     userid: number;
//     role: string;
//     private: boolean;
//     pictureUrl?: string;
// }

export interface ISession {
    credentials: ICredentials;
    user: IUser;
}

export interface IPoundRep {
    lbs: number;
    reps: number;
}

export interface IWorkouts {
    running: number;
    biking: number;
    swimming: number;
    curls: IPoundRep;
    benchPress: IPoundRep;
    deadLift: IPoundRep;
    pushUps: number;
    sitUps: number;
    pullUps: number;
    squats: number;
}

export interface IExerciseChartState {
  workoutType: string;
  exerciseData: number[][];
}

export interface IDeleteModal {
    active: boolean;
}

export interface IState {
    app: IApp;
    session: ISession;
    workoutFields: IWorkouts;
    signUpFields: IUser;
    users: IUser[];
    exerciseChartState: IExerciseChartState;
    deleteModal: IDeleteModal;
}