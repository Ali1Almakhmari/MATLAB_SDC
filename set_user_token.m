function set_user_token(t)
global USER_TOKEN
global LOGIN_TIME

% save login time and token as global variables for checking purposes
LOGIN_TIME = datevec(now);
USER_TOKEN = t;