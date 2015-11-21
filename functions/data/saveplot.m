function saveplot(path_string, file)
%% example
% saveplot('../documentation/images/plots/atmosphere_plot.png',atmosphere_plot.png);

if size(saveplots,2) == 0 % check if saveplots is NULL
    delete_after = 1;
    saveplots = confirm(strcat('Save output image',path_string));
end
if saveplots % conditionally save the plot
    saveas(gcf, path_string);
    export_fig file -m2
end
if delete_after % clean up temporary variables
    clearvars saveplots delete_after
end
