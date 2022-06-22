function t = get_user_token
global LOGIN_TIME

% check login time different scenarios
if isempty(LOGIN_TIME)
    disp('New login needed.  Login is valid for 60 minutes.')
    t = get_sdc_token;
    
elseif etime(datevec(now), LOGIN_TIME) >= 3600
    disp('Login expired.  Please log in again.')
    t = get_sdc_token;
    
else
    global USER_TOKEN
    t = USER_TOKEN;
end