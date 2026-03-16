ggplot(penguins) +
  aes(dims = dims(bill_length_mm:body_mass_g)) +
  aes(color = species) ->
p0

p0 + geom_umap(epochs = 1) ->
p; p0 + geom_umap(epochs = 2) ->
p; p0 + geom_umap(epochs = 3)  ->
p; p0 + geom_umap(epochs = 5)  ->
p; p0 + geom_umap(epochs = 8)  ->
p; p0 + geom_umap(epochs = 13)  ->
p; p0 + geom_umap(epochs = 21)  ->
p; p0 + geom_umap(epochs = 34)  ->
p; p0 + geom_umap(epochs = 55)  ->
p; p0 + geom_umap(epochs = 89)
