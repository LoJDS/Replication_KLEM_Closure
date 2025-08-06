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


unem_data <- read_excel(filename, sheet = "Unem_Export", col_names = TRUE)

unem_data <- pivot_longer(unem_data, cols = 2:25, names_to = "Control", values_to = "Unem")

ggplot(unem_data, aes(x=100*as.numeric(Control), y = 100*Unem, col = as.factor(Closure), linetype = as.factor(Closure))) + geom_line(linewidth = 1.5) + xlab("Energy Demand Control (%)") + ylab("Unemployment")+ scale_color_viridis_d(name = "Closure", option= "turbo") + scale_linetype(name = "Closure") + theme_minimal() + theme(axis.title = element_text(size = 20),  axis.text = element_text(size=15), legend.title = element_text(size=20), legend.text = element_text(size = 15)) + coord_cartesian(ylim=c(-200,100))
ggsave("Main_Files/Figures/Unemgradientggplot.png", width = 10, height = 7, dpi = 400)

GDP_data <- read_excel(filename, sheet = "PIB_Export", col_names = TRUE)

GDP_data <- pivot_longer(GDP_data, cols = 2:25, names_to = "Control", values_to = "GDP")

ggplot(GDP_data, aes(x=100*as.numeric(Control), y = 100*GDP, col = as.factor(Closure), linetype = as.factor(Closure))) + geom_line(linewidth = 1.5) + xlab("Energy Demand Control (%)") + ylab("Real GDP (100% is calibration point)")+ scale_color_viridis_d(name = "Closure", option= "turbo") + scale_linetype(name = "Closure") + theme_minimal() + theme(axis.title = element_text(size = 20),  axis.text = element_text(size=15), legend.title = element_text(size=20), legend.text = element_text(size = 15))
ggsave("Main_Files/Figures/GDPgradientggplot.png", width = 10, height = 7, dpi = 400)


Inv_data <- read_excel(filename, sheet = "Inv_Export", col_names = TRUE)

Inv_data <- pivot_longer(Inv_data, cols = 2:25, names_to = "Control", values_to = "Inv")

ggplot(Inv_data, aes(x=100*as.numeric(Control), y = 100*Inv, col = as.factor(Closure), linetype = as.factor(Closure))) + geom_line(linewidth = 1.5) + xlab("Energy Demand Control (%)") + ylab("Investment (100% is calibration point)")+ scale_color_viridis_d(name = "Closure", option= "turbo") + scale_linetype(name = "Closure") + theme_minimal() + theme(axis.title = element_text(size = 20),  axis.text = element_text(size=15), legend.title = element_text(size=20), legend.text = element_text(size = 15))
ggsave("Main_Files/Figures/Invgradientggplot.png", width = 10, height = 7, dpi = 400)

