## Secret Santa Name Generator

Every year in my family, we like to do a Secret Santa gift exchange at Christmas. There are many services out there to help you generate names, but this year I decided to create my own. It will generate a hash mapping each participant to another with no one matched to themself. 

If you want to try out this script as intended, begin by cloning this repository.

Open up __santa.rb__ and replace the names in the `giver` array with the names of the participants:

    givers = %w[JOHN JANE JACK]

To send emails, you will need a [Mailjet](https://www.mailjet.com/) API Key and Secret Key. Once generated, enter them in your `.env` file as `ENV["MJ_APIKEY_PUBLIC"]` and `ENV["MJ_APIKEY_PRIVATE"]` respectively. You will then need to ensure you have an email in the `.env` file for each of the participants.

Once done, your .env file should look something like this:

    MJ_APIKEY_PUBLIC='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    MJ_APIKEY_PRIVATE='xxxxxxxxxxxxxxxxxxxxxxxx'
    EMAIL_JOHN='john.doe@gmail.com'
    EMAIL_JANE='jane.doe@gmail.com'
    EMAIL_JACK='jack.doe@gmail.com'

_Note: Remember to add .env to your .gitignore file so that no personal data or private tokens are pushed to Github._

Once set up, you can run the name generator with the following command:

    $ ruby santa.rb    

## Further suggestions

- Since the loop is defined by the length of `givers`, you can add as many names as you want.
- If you just want to see the arrays that were generated, you can comment out the final loop and `puts` them to the console.
