source("Libs.R")

####Replicating Main Figures
filename <- "Main_Files/KLEM-MainSimulations.xlsm"
ut_data <- read_excel(filename, sheet = "Utility-export", col_names = TRUE)

ut_data <- pivot_longer(ut_data, cols = 2:25, names_to = "Control", values_to = "Utility")


ggplot(ut_data, aes(x=100*as.numeric(Control), y = 100*Utility, col = as.factor(Closure), linetype = as.factor(Closure))) + geom_line(linewidth = 1.5) + xlab("Energy Demand Control (%)") + ylab("Welfare (% of baseline)") + scale_color_paletteer_d(name="Closure","RColorBrewer::Dark2")  + scale_linetype(name = "Closure") + theme_minimal() + theme(axis.title = element_text(size = 20),  axis.text = element_text(size=15), legend.title = element_text(size=20), legend.text = element_text(size = 15))
ggsave("Main_Files/Figures/Wgradientggplot.png", width = 10, height = 7, dpi = 400)

tax_data <- read_excel(filename, sheet = "Tax_export", col_names = TRUE)

tax_data <- pivot_longer(tax_data, cols = 2:25, names_to = "Control", values_to = "Tax")

ggplot(tax_data, aes(x=100*as.numeric(Control), y = Tax, col = as.factor(Closure), linetype = as.factor(Closure))) + geom_line(linewidth = 1.5) + xlab("Energy Demand Control (%)") + ylab("Carbon price (Log Scale)") +scale_y_continuous(transform="log", breaks = c(1,10, 100))+ scale_color_paletteer_d(name="Closure","RColorBrewer::Dark2")  + scale_linetype(name = "Closure") + theme_minimal() + theme(axis.title = element_text(size = 20),  axis.text = element_text(size=15), legend.title = element_text(size=20), legend.text = element_text(size = 15))
ggsave("Main_Files/Figures/Taxgradientggplot.png", width = 10, height = 7, dpi = 400)



pshare_data <- read_excel(filename, sheet = "PShare_export", col_names = TRUE)

pshare_data <- pivot_longer(pshare_data, cols = 2:25, names_to = "Control", values_to = "PShare")

ggplot(pshare_data, aes(x=100*as.numeric(Control), y = 100*PShare, col = as.factor(Closure), linetype = as.factor(Closure))) + geom_line(linewidth = 1.5) + xlab("Energy Demand Control (%)") + ylab("Profit Share")+ scale_color_viridis_d(name = "Closure", option= "turbo") + scale_linetype(name = "Closure") + theme_minimal() + theme(axis.title = element_text(size = 20),  axis.text = element_text(size=15), legend.title = element_text(size=20), legend.text = element_text(size = 15))
ggsave("Main_Files/Figures/PSharegradientggplot.png", width = 10, height = 7, dpi = 400)