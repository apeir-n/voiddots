local M = {}

M.snuggle_messages = {
  "I love my Daddy Bear soooo much!! 🐻💖🍼",
  "Big warm hugs for my cozy dadda!! 🤗🐻💞",
  "Snuggle alert!! Diaper bear love incoming!! 🍼💥🐾",
  "My heart is full of fuzzy daddy bear hugs!! 💓🐻✨",
  "Crinkle cuddles make everything better 😚💖💤",
  "I'm the luckiest raccoon with the bestest dadda! 🦝🍼🐻",
  "Binky kisses and belly pats for my dadda! 😘🍼🐻",
  "Daddy's chest is the comfiest place in the universe 🥺💖🐻",
  "Cuddle detected! Deploying fluffy hugs in 3... 2... 1... 💥💖🧸",
  "Wuv you so much it makes my tail go wigglewigglewiggle!!! 🐾🙈💕",
  "Belly to belly, heart to heart, I never want us to be apart 😚🐻💞",
  "Dadda makes my babybrain go soft and squishy 😵‍💫💖🍼",
  "I feel safest when I’m wrapped in Daddy Bear’s arms 🐻🫂✨",
  "Every bumbum pat is a fuzzy hug from the universe 🐻🍑💫",
  "One snuggle with dadda = infinite baby joy! 😝🍼💖",
}

function M.ShowSnuggle()
  local message = M.snuggle_messages[math.random(1, #M.snuggle_messages)]
  vim.notify(message, vim.log.levels.INFO, {
    title = "Baby Message ✨",
    timeout = 3000,
  })
end

return M
