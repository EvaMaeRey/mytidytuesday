library(ggswim)
library(ggplot2)
patient_data |>
  ggplot() +
  aes(x = start_time, 
      y = pt_id) + 
  labs(title = "My Swimmer Plot") +
  labs(x = "Time Since Infusion (Months)") + 
  labs(y = "Patient ID") +
  theme_ggswim() +
  geom_swim_lane(aes( 
      xend = end_time,
      color = disease_assessment) ) +
  geom_swim_arrow(
     data = arrow_data,
     mapping = aes(x = NULL, 
                   xend = end_time, 
                   y = pt_id)) +
  scale_color_brewer(
    name = "Overall Disease Assessment",
    palette = "Set1"
  ) +
  new_scale_color() +
  geom_swim_point(
    data = infusion_events,
    aes(x = time_from_initial_infusion,
        color = infusion_type),
    size = 5
  ) +
  geom_swim_label(
    data = end_study_events,
    aes(x = time_from_initial_infusion, 
        label_vals = end_study_label, 
        label_names = end_study_name),
    label.size = NA, fill = NA, size = 5
  ) +
  scale_color_brewer(name = "Markers", palette = "Set2")
