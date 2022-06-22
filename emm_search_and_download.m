function emm_search_and_download(download_dir, QueryParameters , use_sdc_dir_structure, token)
%%
% function emm_search_and_download(download_dir, QueryParameters , use_sdc_dir_structure, token)
% This function will download files to a local directory on the user's machine.  
% It will prompt the user to enter a username and password.
%
% Inputs:
% -------
% download_dir: (Required) The location where you would like the files to be saved.
% QueryParameters: Query parameters that the API accepts.
%
% Outputs:
%---------
% None, but files are downloaded that match the input parameters
%%

if nargin < 4 || isempty(token)
    token = get_user_token;
end

% Query the SDC for relevant files
q = query_science_files(QueryParameters, token);

% Download all matching files
if ~isempty(q)
    download_from_query(q, download_dir, use_sdc_dir_structure, token)
end