import { shallow } from '@vue/test-utils'
import App from 'components/app'

describe('App', () => {
    const wrapper = shallow(App)

    it('renders the correct markup', () => {
        expect(wrapper.html()).toContain('<b-container id="app">')
    })
})