function download_from_query(query_results, download_dir, use_sdc_dir_structure, token)
%% A function that downloads files based on the output of "query_science_files".
% Inputs:
% -------
% query_results         : The JSON object returned from the "query_science_files" functions
% token                 : The Token string (retrieved from "get_token") that validates the user.
%                         This is not needed unless you plan on retrieving your token using a method not found in this module.
% download_dir          : The location where you would like the files to be saved.
% use_sdc_dir_structure : 'True';
%
% Output:
% -------
% None, but downloads the files to "download_dir"
%%

% check for token if it is not an input
if nargin < 4 || isempty(token)
    token = get_user_token;
end

headers = matlab.net.http.field.GenericField('Authorization', token);
query_url = 'https://mdhkq4bfae.execute-api.eu-west-1.amazonaws.com/prod/science-files-download?';

for f = 1:numel(query_results)
    
    query_parameters = ['&file_name=' , query_results(f).file_name];
    query_url_with_parameters = [query_url query_parameters];
    
    if use_sdc_dir_structure
        download_dir_full_path = strrep([download_dir query_results(f).directory_path '/'],'s3://data-sdc-emmsdc-mbrsc/','');
    else
        download_dir_full_path = download_dir;
    end
    
    if ~isfolder(download_dir_full_path)
        mkdir(download_dir_full_path)
    end
    
    file_name_and_path = [download_dir_full_path  query_results(f).file_name];
    if isfile(file_name_and_path)
        disp(['File is Existed : ' query_results(f).file_name])
        
    else
        try
            disp(['Downloading File: ' query_results(f).file_name])
            tic
            options = weboptions('HeaderFields', headers,'Timeout', 60);
            single_file_location = webread(query_url_with_parameters,options);
            websave(file_name_and_path,single_file_location);
            toc

        catch e
            disp(['Could not download file ' query_results(f).file_name ' due to error: ' e.message])
        end
    end
end