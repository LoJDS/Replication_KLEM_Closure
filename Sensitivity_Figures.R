source("Libs.R")

prefix <- "Sensitivity_Analysis"
output_folder <- "Sensitivity_Analysis/Figures/"
filelist <- list.files("Sensitivity_Analysis")[-1]

for (i in seq_along(filelist)){
  print(i)
  var <- gsub(".xlsm", "", gsub("KLEM-Sensitivity-", "",filelist[i],))
  filename <- paste(prefix,filelist[i],sep="/")
  ut_data <-  read_excel(filename, sheet = "Utility_Export", col_names = TRUE) %>%pivot_longer(cols = 2:25, names_to = "Control", values_to = "Utility")
  ggplot(ut_data_altIO, aes(x=100*as.numeric(Control), y = 100*Utility, col = as.factor(Closure), linetype = as.factor(Closure))) + geom_line(linewidth = 1.5) + xlab("Energy Demand Control (%)") + ylab("Welfare (% of baseline)") + scale_color_paletteer_d(name="Closure","RColorBrewer::Dark2")  + scale_linetype(name = "Closure") + theme_minimal() + theme(axis.title = element_text(size = 20),  axis.text = element_text(size=15), legend.title = element_text(size=20), legend.text = element_text(size = 15))
  ggsave(paste0(output_folder,"/Wgradientggplot", var, ".png"), width = 10, height = 7, dpi = 400)
}

