# libraries
library(tidyverse)
library(haven)


# data
df = read_dta("/Users/juan/Dropbox/teaching/davis/pol51/data/VOTER_Survey_Jan217_Release1-dta.dta")

df_2017 = read_dta("/Users/juan/Dropbox/Mac/Downloads/dfvsg_2017_VOTER_Survey-DTA/VOTER_Survey_July17_Release1-dta.dta")

# keep
keep = c("vote2020_2019", "trumpapp_2019", 
         "fav_trump_2019", "fav_obama_2019", 
         "fav_hrc_2019", "fav_sanders_2019", 
         "fav_putin_2019", "votereg_2019", 
         "turnout18post_2019", "inst_*_2019", 
         "Men_2019", "Women_2019", "bm_2019", 
         "bw_2019", "ww_2019", "wm_2019", 
         "hw_2019", "hm_2019")


# favorability
favor = df %>% 
  select(birthyr_2019, gender_2019, race_2019, pid3_2019, 
         pid7_2019, contains(c("fav_"))) %>% 
  drop_na()


# thermometer
therm_2017 = df_2017 %>% 
  select(birth_year = birthyr_baseline, sex = gender_baseline, 
         race = race_baseline, party_id = pid3_2017, 
         educ_2017,
         ft_black_2017:ft_rep_2017) %>% 
  mutate(sex = as_factor(sex), 
         race = as_factor(race), 
         educ_2017 = as_factor(educ_2017),
         party_id = as_factor(party_id)) %>% 
  mutate(across(c(ft_black_2017:ft_rep_2017), 
                ~ifelse(. > 100, NA, .))) %>% 
  drop_na(sex, race, party_id, educ_2017)




# the issues --------------------------------------------------------------


keep = c("immi_naturalize_2016", "gaymar_2016", "deathpen_2016", 
         "univhealthcov_2016", "envwarm_2016", "taxdoug_2016", 
         "amshamed_2016", "gunown_2016")

issues = df %>% 
  select(state = state_2018, 
         birth_year = birthyr_baseline, sex = gender_baseline, 
         all_of(keep)) %>% 
  mutate(across(.cols = c(immi_naturalize_2016:univhealthcov_2016),
                .fns = ~ case_when(. == 1 ~ 1, 
                                   . == 2 ~ 0, 
                                   TRUE ~ NA_real_)), 
         sex = as_factor(sex), 
         state = as_factor(state), 
         gunown_2016 = case_when(gunown_2016 %in% c(1, 2) ~ 1, 
                                 gunown_2016 == 3 ~ 0, 
                                 TRUE ~ NA_real_), 
         amshamed_2016 = ifelse(amshamed_2016 > 4, NA, amshamed_2016)) %>% 
  drop_na(state)


# write out
write_csv(issues, "../files/voter-files-issues.csv")








# save for class
write_csv(therm_2017, "../files/voter-files-therm.csv")

# issues
issues = df %>% 
  select(birth_year = birthyr_2019, sex = gender_2019, 
         race = race_2019, party_id = pid3_2019, 
         crime = imiss_a_2019, economy = imiss_b_2019, 
         immigration = imiss_c_2019, 
         family_medical_leave = imiss_i_2019,
         abortion = imiss_t_2019,
         gay_rights = imiss_f_2019, 
         health_care = imiss_j_2019) %>% 
  mutate(sex = as_factor(sex), 
         race = as_factor(race), 
         party_id = as_factor(party_id)) %>% 
  mutate(across(crime:health_care, ~ifelse(. > 4, NA, .))) %>% 
  # reverse code
  mutate(across(crime:health_care, ~5-.)) %>% 
  drop_na(sex)


# save for class
write_csv(issues, "../files/voter-files-issues.csv")




df$bankpoor_2019[df$bankpoor_2019 >= 0 & df$bankpoor_2019 < 1e6] %>% summary()
df$bankrich_2019[df$bankrich_2019 >= 0] %>% summary()



# institutional trust
inst = df %>% 
  select(birthyr_2019, gender_2019, race_2019, pid3_2019, 
         pid7_2019, inst_court_2019:inst_business_2019) %>% 
  drop_na()



