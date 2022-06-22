function QueryParameters = set_QueryParameters
%% 
% Single-value parameters: 
% ------------------------
% instrument_id     : "emr', 'exi', or 'emu' to filter for EXI, EMIRS, and EMUS data, respectively. 
% data_level        : 'l0', 'l1', 'l2', '1', 'l1a', 'l1b', 'l2', 'l2a', 'l2b', and 'l3', though there may be some other data levels available in the future.
% latest            : 'true' will only return the latest version of the data, and 'false' will return it all. Default is 'true'. Must be in string format.
% pred_rec          : Can be 'p', 'r', 'n', or 'f', which filters files based on usage of "predicted", "reconstructed", "final", or "N/A" SPICE kernels
% orbit_num         : An integer that represents the orbit number of files to search
% mode              : A string the represents the instrument's observation mode; 'os4', 'xos5', 'SYS015', etc. (different observations ae listed in instrument documentation)
% 
% Ranged query parameters:
% -----------------------
% start_date        : A string date time formatted as "YYYY-MM-DD" which represents the UTC start date of the data to query
% end_date          : A string date time formatted as "YYYY-MM-DD" which represents the UTC end date of the data to query
% start_sc_lst      : A string time formatted as "HH:MM:SS" which represents the start of the Local Solar Time of the sub-spacecraft point
% end_sc_lst        : A string time formatted as "HH:MM:SS" which represents the end of the local Solar Time of the sub-spacecraft point
% start_mars_ls     : A number which represents the start of the Mars Season to query
% end_mars_ls       : A number which represents the end of the Mars Season to query
% start_sc_lat      : A number which represents the start of the IAU MARS Planetographic sub-spacecraft latitude
% end_sc_lat        : A number which represents the end of the IAU MARS Planetographic sub-spacecraft latitude
% start_sc_lon      : A number which represents the start of the IAU MARS Planetographic sub-spacecraft longitude
% end_sc_lon        : A number which represents the end of the IAU MARS Planetographic sub-spacecraft longitude
% start_sc_alt      : A number which represents the start of the IAU MARS Planetographic spacecraft altitude
% end_sc_alt        : A number which represents the end of the IAU MARS Planetographic spacecraft altitude
% start_subsolar_lat: A number which represents the start of the IAU MARS Planetographic subsolar latitude
% end_subsolar_lat  : A number which represents the end of the IAU MARS Planetographic subsolar latitude
% start_subsolar_lon: A number which represents the start of the IAU MARS Planetographic subsolar longitude
% end_subsolar_lon  : A number which represents the end of the IAU MARS Planetographic subsolar longitude

QueryParameters = [];
QueryParameters.instrument_id = [];
QueryParameters.data_level = [];
QueryParameters.latest = 'true';
QueryParameters.pred_rec = [];
QueryParameters.orbit_num = [];
QueryParameters.mode = [];

QueryParameters.mode = [];
QueryParameters.file = [];
QueryParameters.start_date = [];
QueryParameters.end_date = [];
QueryParameters.start_sc_lst = [];
QueryParameters.end_sc_lst = [];
QueryParameters.start_mars_ls = [];
QueryParameters.end_mars_ls = [];
QueryParameters.start_sc_lat = [];
QueryParameters.end_sc_lat = [];
QueryParameters.start_sc_lon = [];
QueryParameters.end_sc_lon = [];
QueryParameters.start_sc_alt = [];
QueryParameters.end_sc_alt = [];
QueryParameters.start_subsolar_lat = [];
QueryParameters.end_subsolar_lat = [];
QueryParameters.start_subsolar_lon = [];
QueryParameters.end_subsolar_lon = [];