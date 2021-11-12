## Secret Santa Name Generator

Every year in my family, we like to do a Secret Santa gift exchange at Christmas. There are many services out there to help you generate names, but this year I decided to create my own. It generates two arrays: one for each of the main participants and another for 4 of the participants' partners. It then sends out an email to each of the participants informing them of the name(s) selected for them. The goal of this code was to ensure that noone ended up with their own name or that of their partner.

If you want to try out my script as intended, begin by cloning this repository.

Open up __santa.rb__ and replace the following variables with the names and emails of the participants:

    emails = [ENV['EMAIL_JENNY'], ENV['EMAIL_JOE'], ENV['EMAIL_KATIE'],
              ENV['EMAIL_SAM'], ENV['EMAIL_DAD'], ENV['EMAIL_MUM']]
    givers = %w[Jenny Joe Katie Sam Dad Mum]
    partners = %w[Daniel Viktor Rob Cat]

To send emails, you will need a [SendGrid API Key](http://www.sendgrid.com). Once generated, enter it as your `ENV['SENDGRID_API_KEY']`.

Once set up, you can run the name generator with the following command:

    $ ruby santa.rb
    
_Note: you might want to test it out with your own email first before spamming everyone else!_

## Further suggestions

- If you're only doing one list, replace `#{takers_string}` with `#{takers[i]}`.
- Since the loop is defined by the length of `givers`, you can add as many names as you want.
- If you just want to see the arrays that were generated, you can comment out the final loop and `puts` them to the console.
