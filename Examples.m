%% Examples

%% Example 1:
% QueryParameters = set_QueryParameters;
% QueryParameters.instrument_id='emu';
% download_dir = 'C:\Users\Ali1Almakhmari\Desktop\EMM SDC\';
% use_sdc_dir_structure = false;
% % direct call for all files:
% emm_search_and_download(download_dir, QueryParameters , use_sdc_dir_structure)


%% Example 2:
% QueryParameters = set_QueryParameters;
% QueryParameters.instrument_id='emu';
% download_dir = 'C:\Users\Ali1Almakhmari\Desktop\EMM SDC\';
% % selece number of files:
% token = get_sdc_token;
% file_list = query_science_files(QueryParameters, token);
% test_file = file_list(2:5);
% download_from_query(test_file, download_dir , false, token)

%% Example 3: match - correct
% QueryParameters = set_QueryParameters;
% QueryParameters.instrument_id='emu';
% QueryParameters.start_mars_ls=130;
% QueryParameters.end_mars_ls=250;
% file_list = query_science_files(QueryParameters);

%% Example 4: match - correct
% QueryParameters = set_QueryParameters;
% QueryParameters.instrument_id='emr';
% QueryParameters.data_level='l1a,l1b';
% QueryParameters.start_sc_alt=22000;
% QueryParameters.end_sc_alt=35000;
% file_list = query_science_files(QueryParameters);

%% Example 5:
% QueryParameters = set_QueryParameters
% QueryParameters.instrument_id='emr';
% QueryParameters.data_level='l1a';
% QueryParameters.start_date='2021-02-24';
% QueryParameters.end_date='2021-02-26';  % end date should be the day after the exact required period. code will bring result between 24-02-2021 and 25-02-2021
% file_list = query_science_files(QueryParameters);
