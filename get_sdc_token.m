function t = get_sdc_token(user_name, password)

%%
% function t = get_sdc_token(user_name, password)
% This function authenticates the user with the EMM SDC.  An access token is automatically stored in the USER_TOKEN
% variable in this file, and functions will attempt to find a valid user token in that variable.
%
% Inputs:
%-------
% user_name: User's EMM SDC username as string. It can be empty [].
% password : User's EMM SDC password as string. It can be empty [].
%
% Output:
% -------
% t: A string that also gets stored in the USER_TOKEN variable in this file.  You don't need this string unless
% you plan on making your own API calls, using functions outside of this file.

%% Check for user_name and password
if nargin == 0
    user_name = input('Username:','s');
    password = input(['Password for ' user_name ':'],'s');
end
if nargin == 1
    if isempty(user_name)
        user_name = input('Username:','s');
    end
    password = input(['Password for ' user_name ':'],'s');
end
if nargin == 2
    if isempty(user_name)
        user_name = input('Username:','s');
    end
    if isempty(password)
        password = input(['Password for ' user_name ':'],'s');
    end
end

%% Prepare link to grab the SDC token
authentication_url = 'https://cognito-idp.eu-west-1.amazonaws.com/';
header_1 = matlab.net.http.field.GenericField('X-Amz-Target','AWSCognitoIdentityProviderService.InitiateAuth');
header_2 = matlab.net.http.field.GenericField('Content-Type', 'application/x-amz-json-1.1');
authentication_header = [header_1 header_2];
options = weboptions('HeaderFields', authentication_header);
data = jsonencode(struct('ClientId', 'n5e6d97bl4ba76rrdtm0qaq6n','AuthFlow','USER_PASSWORD_AUTH', 'AuthParameters', struct('USERNAME', user_name,'PASSWORD',password)));


%% Attempt to grab the SDC token.
try
    response = webwrite(authentication_url,data,options);
    t = response.AuthenticationResult.AccessToken;
    set_user_token(t);
catch
    disp('Invalid username and/or password.  Please try again.')
    t = [];
end