function PlotTrainingRes(train_res)
%PLOTTRAININGRES Plot the results of the training process
% train_res - The output of the Train function

plot(train_res.n_disp.*(1:train_res.res_plot_max), train_res.res_plot);
xlabel('# of training games');
ylabel('%');
legend({'Losses', 'Ties', 'Wins'});

end
