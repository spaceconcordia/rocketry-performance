function blkStruct = slblocks
    % this function specifies that the library should 
    % appear in the library browser and be cached
    % in the browser repository

    Browser.Library = 'rocket_data_library.slx';
    Browser.Name = 'Rocket Data Library';

    blkStruct.Browser = Browser;
