function file_list = query_science_files(QueryParameters, token)
%% function query_science_files(QueryParameters, token):
% This function queries the SDC for files based on the input parameters, and returns a list of dictionaries, with each
% dictionary containing information about the file (version, date, local solar time, etc)
%
% Inputs:
% -------
% QueryParameters: See function set_QueryParameters for a list of all query parameters that the API accepts.
% token          : The Token string (retrieved from "get_sdc_token") that validates the user.
%                  This is not needed unless you plan on retrieving your token using a method not found in this module.
%
% Otuput:
%--------
% file_list: A structure describing the science data discovered by the query

% check for token if it is not an input
if nargin < 2 || isempty(token)
    token = get_user_token;
end

headers = matlab.net.http.field.GenericField('Authorization', token);
query_url = 'https://mdhkq4bfae.execute-api.eu-west-1.amazonaws.com/prod/science-files-metadata?';

query_parameters = [];

fns = fieldnames(QueryParameters);
for i = 1:numel(fns)
    QueryParameter_value = eval(['QueryParameters.' fns{i}]);
    if ~isempty(QueryParameter_value)
        query_parameters = [query_parameters '&' fns{i} '=' num2str(QueryParameter_value)];
    end
end

query_url_with_parameters = [query_url query_parameters];    

try
    options = weboptions('HeaderFields', headers);
    file_list = webread(query_url_with_parameters,options);
catch e
    file_list = [];
    disp(['Could not finish query due to error: ' e.message])
end
try
    if (file_list.status_code == 504) || (file_list.status_code == 502)
        disp('Too many files found in API query.')
        disp('Please narrow search. For example try breaking up search parameters with start_date/end_date to only search a few months at a time.')     
    end
catch
end