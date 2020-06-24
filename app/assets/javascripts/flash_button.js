function getFlash() {
	const flashNotice = document.querySelector('.notice');
	return flashNotice
}

const closeFlashButton = document.createElement('button');
console.log(flashNotice);

flashNotice.insertAdjacentElement('afterbegin', closeFlashButton);
closeFlashButton.innerHTML = `
<?xml version="1.0"?>
<svg xmlns="http://www.w3.org/2000/svg" class="w-8 self-end fill-current text-white" viewBox="0 0 48 48" width="48"><path d="M38 12.83l-2.83-2.83-11.17 11.17-11.17-11.17-2.83 2.83 11.17 11.17-11.17 11.17 2.83 2.83 11.17-11.17 11.17 11.17 2.83-2.83-11.17-11.17z"/><path d="M0 0h48v48h-48z" fill="none"/>
	
	
	<metadata>
		<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/elements/1.1/">
			<rdf:Description about="https://iconscout.com/legal#licenses" dc:title="Close, Delete, Remove, Cancel, Ui" dc:description="Close, Delete, Remove, Cancel, Ui" dc:publisher="Iconscout" dc:date="2016-12-14" dc:format="image/svg+xml" dc:language="en">
				<dc:creator>
					<rdf:Bag>
						<rdf:li>Google Inc.</rdf:li>
					</rdf:Bag>
				</dc:creator>
			</rdf:Description>
		</rdf:RDF>
    </metadata></svg>`

closeFlashButton.addEventListener('click', closeFlash);

function closeFlash(event) {
  const clickedButton = event.currentTarget;
  clickedButton.closest('.notice').remove();
}

