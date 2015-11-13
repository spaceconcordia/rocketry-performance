function multiplot(xaxis_list, xaxis_labels, xaxis_lim_list, yaxis_list, yaxis_labels, yaxis_lim_list, yaxis_titles)
%--------------------------------------------------------------------------
% This function plots a dynamic number of input data into subplots,
% and additionally identifies the maximum and minimum points on each plot
%--------------------------------------------------------------------------
% example multiplot ( 
%       [[0,1,2],[0,1,2]], ['x','x_1'], [[0,2],[0,2]], 
%       [[0,1,2],[0,1,2]], ['y','y_1'], [[0,2],[0,2]], ['y=x','y_1=x_1'] 
% )
%--------------------------------------------------------------------------

number_of_plots = size(yaxis_list,2);

for i = 1:number_of_plots 

    xaxis = xaxis_list(:,i);
    size(xaxis)
    yaxis = yaxis_list(:,i);
    size(yaxis)
    
    xaxis_lims = xaxis_lim_list(i,:);
    yaxis_lims = yaxis_lim_list(i,:);
    xaxis_lims = xaxis_lims.'
    yaxis_lims = yaxis_lims.'
    yaxis_title = yaxis_titles(i,:)
    xaxis_label = xaxis_labels(i,:)
    yaxis_label = yaxis_labels(i,:)

    subplot ( number_of_plots,       1,    ( i )   ) ;
    plot    ( xaxis, yaxis                     ) ;
    title   ( yaxis_title                      ) ;
    xlabel  ( xaxis_labels                     ) ;
    ylabel  ( yaxis_labels                     ) ;
    ylim    ( yaxis_lims                       ) ;
    xlim    ( xaxis_lims                       ) ;

    %----------------------------------------------------------------------
    % locate and plot maximum
    %----------------------------------------------------------------------
    indexmax = find(max(yaxis) == yaxis)
    xmax = yaxis(indexmax)
    ymax = yaxis(indexmax)

    %strmax = ['Maximum = ',num2str(ymax)];
    %text(xmax,ymax,strmax,'HorizontalAlignment','right');
end

